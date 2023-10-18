//
//  ManagerProtocols.swift
//  RemindMe
//
//  Created by Tosun, Irem on 17.10.2023.
//

import Foundation

protocol LectureStorageProtocol {
    func save(_ model: Lecture) throws
    func fetch() throws -> [Lecture]
    func delete(_ model: Lecture) throws
}

protocol StudentStorageProtocol {
    func save(_ model: Student) throws
    func fetch() throws -> [Student]
    func delete(_ model: Student) throws
}

protocol SchoolStorageProtocol {
    func save(_ model: School) throws
    func fetch() throws -> [School]
    func delete(_ model: School) throws
}
