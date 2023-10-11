//
//  SchoolRealmManager.swift
//  RemindMe
//
//  Created by Tosun, Irem on 11.10.2023.
//

import Foundation

protocol SchoolRealmManagerProtocol {
    func save(_ model: School) throws
    func fetch() throws -> [School]
    func delete(_ model: School) throws
}

final class SchoolRealmManager: BaseRealmManager<SchoolRealmModel>, SchoolRealmManagerProtocol {
}
