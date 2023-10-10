//
//  PersistenceManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
public class BasePersistenceManager<T> where T: PersistentModel, T: CommonDataProtocol, T.EntityType: StorageProtocol {
    typealias PersistentType = T.Type

    let context: ModelContext

    private var items: [T] = []

    init(context: ModelContext) {
        self.context = context
    }

    public func save(_ model: T) throws {
        context.insert(model)
        try context.save()
    }

    public func fetch() throws -> [T] {
        let descriptor = FetchDescriptor<T>()//(sortBy: [SortDescriptor(\.title)])
        items = try context.fetch(descriptor)
        return items
    }

    public func delete(indexSet: IndexSet) throws {
        try indexSet.forEach { index in
            let item = items[index]
            context.delete(item)
            try context.save()
        }
    }

}
