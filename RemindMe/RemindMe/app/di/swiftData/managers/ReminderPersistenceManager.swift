//
//  ReminderManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation

protocol ReminderPersistenceManagerProtocol {
    func save(_ model: Reminder) throws
    func fetch() throws -> [Reminder]
    func delete(_ model: Reminder) throws
}

final class ReminderPersistenceManager: BasePersistenceManager<ReminderPersistentModel>, ReminderPersistenceManagerProtocol {
    
}
