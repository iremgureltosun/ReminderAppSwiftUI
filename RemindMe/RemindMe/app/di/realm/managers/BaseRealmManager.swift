//
//  BaseRealmManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift
import SwiftUI

@MainActor
class BaseRealmManager<T>: ManagerProtocol where T: DataEntity, T: Object, T.EntityType: CommonModel {
    typealias EntityType = T.EntityType

    private var items: [EntityType] = []

    init() {
    }

    func save(_ model: EntityType) throws {
        guard let realm = Realm.safeInit() else {
            throw PersistenceError.realmError
        }

        try realm.safeWrite {
            realm.add(T(model))
        }
    }

    func fetch() throws -> [EntityType] {
        guard let realm = Realm.safeInit() else {
            return []
        }
        let objects = realm.objects(T.self)
        return objects.map { $0.getModel() }
    }

    func delete(_ model: EntityType) throws {
        guard let realm = Realm.safeInit() else {
            throw PersistenceError.realmError
        }

        guard let modelObject = model as? Object else {
            throw PersistenceError.realmError
        }

        guard modelObject.realm != nil else {
            throw PersistenceError.realmError
        }

        do {
            try realm.write {
                realm.delete(modelObject)
            }
        } catch {
            throw PersistenceError.realmError
        }
    }
}

extension Realm {
    static func safeInit() -> Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            print("safe init \(error)")
        }
        return nil
    }

    public func safeWrite(_ block: () throws -> Void) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
