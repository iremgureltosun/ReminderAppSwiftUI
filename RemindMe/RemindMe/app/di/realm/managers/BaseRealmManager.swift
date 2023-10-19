//
//  BaseRealmManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift

@MainActor
class BaseRealmManager<T>: ManagerProtocol where T: StorageProtocol, T: Object, T.EntityType: CommonModelProtocol {
    typealias EntityType = T.EntityType

    private var items: [EntityType] = []

    init() {}

    func save(_ model: EntityType) throws {
        let realm = try Realm()
        try realm.write {
            realm.add(T(model))
        }
    }

    func fetch() throws -> [EntityType] {
        let realm = try Realm()
        let objects = realm.objects(T.self)
        return objects.map { $0.getModel() }
    }

    func delete(_ model: EntityType) throws {
        let realm = try Realm()

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
