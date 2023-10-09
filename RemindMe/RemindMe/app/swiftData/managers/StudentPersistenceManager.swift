//
//  StudentPersistenceManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation

public protocol StudentPersistenceManagerProtocol {
    func save(_ model: StudentModel) throws
    func fetch() throws -> [StudentModel]
    func delete(indexSet: IndexSet) throws 
}

public final class StudentPersistenceManager: BasePersistenceManager<StudentModel>, StudentPersistenceManagerProtocol {
}
