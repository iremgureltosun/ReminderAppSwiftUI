//
//  SchoolPersistenceManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation

protocol SchoolPersistenceManagerProtocol {
    func save(_ model: School) throws
    func fetch() throws -> [School]
    func delete(_ model: School) throws 
}

final class SchoolPersistenceManager: BasePersistenceManager<SchoolPersistentModel>, SchoolPersistenceManagerProtocol {
}
