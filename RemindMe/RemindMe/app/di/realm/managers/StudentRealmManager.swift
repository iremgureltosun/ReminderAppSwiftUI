//
//  StudentRealmManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 11.10.2023.
//

import Foundation

protocol StudentRealmManagerProtocol {
    func save(_ model: Student) throws
    func fetch() throws -> [Student]
    func delete(_ model: Student) throws
}

final class StudentRealmManager: BaseRealmManager<StudentRealmModel>, StudentRealmManagerProtocol {
}
