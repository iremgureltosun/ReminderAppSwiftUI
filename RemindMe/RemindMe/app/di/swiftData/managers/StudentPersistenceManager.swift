//
//  StudentPersistenceManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation

protocol StudentPersistenceManagerProtocol {
    func save(_ model: Student) throws
    func fetch() throws -> [Student]
    func delete(_ model: Student) throws
}

final class StudentPersistenceManager: BasePersistenceManager<StudentModel>, StudentPersistenceManagerProtocol {
}
