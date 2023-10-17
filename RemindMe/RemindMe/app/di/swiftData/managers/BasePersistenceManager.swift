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

    let modelContainer = try! ModelContainer(for: LecturePersistentModel.self, StudentPersistentModel.self, SchoolPersistentModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))

    private var items: [EntityType] = []

    func save(_ model: EntityType) throws {
        modelContainer.mainContext.insert(T(model))
        try modelContainer.mainContext.save()
    }

    func fetch() throws -> [EntityType] {
        let descriptor = FetchDescriptor<T>() // (sortBy: [SortDescriptor(\.title)])
        let dbitems = try modelContainer.mainContext.fetch(descriptor)
        items = dbitems.map { $0.getModel() }
        return items
    }

    func delete(_ model: EntityType) throws {
        modelContainer.mainContext.delete(T(model))
        try modelContainer.mainContext.save()
    }
}
