//
//  SchoolPersistenceManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation

public protocol SchoolPersistenceManagerProtocol {
    func save(_ model: SchoolModel) throws
    func fetch() throws -> [SchoolModel]
}

public final class SchoolPersistenceManager: BasePersistenceManager<SchoolModel>, SchoolPersistenceManagerProtocol {
}
