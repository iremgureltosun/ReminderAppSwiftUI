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
    associatedtype EntityType: CommonModelProtocol
}

@MainActor
class BasePersistenceManager<T>: ManagerProtocol where T: StorageProtocol, T: PersistentModel, T.EntityType: CommonModelProtocol {
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
        items = dbitems.map { $0.getModel() }
        return items
    }

    func delete(_ model: EntityType) throws {
        context.delete(T(model))
        try context.save()
    }
}
