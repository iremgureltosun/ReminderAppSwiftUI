//
//  ReminderManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation

public protocol ReminderPersistenceManagerProtocol {
    func save(_ model: ReminderModel) throws
    func fetch() throws -> [ReminderModel]
    func delete(indexSet: IndexSet) throws 
}

public final class ReminderPersistenceManager: BasePersistenceManager<ReminderModel>, ReminderPersistenceManagerProtocol {
}
