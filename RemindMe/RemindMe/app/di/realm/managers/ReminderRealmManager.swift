//
//  ReminderRealmManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 11.10.2023.
//

import Foundation

protocol ReminderRealmManagerProtocol {
    func save(_ model: Reminder) throws
    func fetch() throws -> [Reminder]
    func delete(_ model: Reminder) throws
}

final class ReminderRealmManager: BaseRealmManager<ReminderRealmModel>, ReminderRealmManagerProtocol {
}
