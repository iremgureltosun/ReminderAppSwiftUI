//
//  ReminderManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation

protocol ReminderPersistenceManagerProtocol {
    func save(_ model: ReminderModel) throws
    func fetch() throws -> [ReminderModel]
    func delete(indexSet: IndexSet) throws
}

final class ReminderPersistenceManager: BasePersistenceManager<ReminderModel>, ReminderPersistenceManagerProtocol {
}
