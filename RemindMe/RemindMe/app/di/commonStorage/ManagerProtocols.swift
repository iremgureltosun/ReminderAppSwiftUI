//
//  ManagerProtocols.swift
//  RemindMe
//
//  Created by Tosun, Irem on 17.10.2023.
//

import Foundation

protocol ReminderManagerProtocol {
    func save(_ model: Reminder) throws
    func fetch() throws -> [Reminder]
    func delete(_ model: Reminder) throws
}

protocol StudentManagerProtocol {
    func save(_ model: Student) throws
    func fetch() throws -> [Student]
    func delete(_ model: Student) throws
}

protocol SchoolManagerProtocol {
    func save(_ model: School) throws
    func fetch() throws -> [School]
    func delete(_ model: School) throws
}
