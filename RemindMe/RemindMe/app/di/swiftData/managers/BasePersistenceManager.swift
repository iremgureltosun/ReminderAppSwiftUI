//
//  PersistenceManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

protocol ManagerProtocol {
    associatedtype EntityType: DataModel
}

@MainActor
class BasePersistenceManager<T>: ManagerProtocol where T: DataEntity, T: PersistentModel, T.EntityType: DataModel {
    typealias EntityType = T.EntityType

    let context: ModelContext

    private var items: [EntityType] = []

    init(context: ModelContext) {
        self.context = context
    }

    func save(_ model: EntityType) throws {
        context.insert(T(model))
        try context.save()
    }

    func fetch() throws -> [EntityType] {
        let descriptor = FetchDescriptor<T>() // (sortBy: [SortDescriptor(\.title)])
        let dbitems = try context.fetch(descriptor)
        items = dbitems.map { $0.getDataModel() }
        return items
    }

    func delete(_ model: EntityType) throws {
        context.delete(T(model))
        try context.save()
    }
}
