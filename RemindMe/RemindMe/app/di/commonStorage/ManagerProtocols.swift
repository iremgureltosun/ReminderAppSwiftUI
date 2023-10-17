//
//  ManagerProtocols.swift
//  RemindMe
//
//  Created by Tosun, Irem on 17.10.2023.
//

import Foundation

protocol LectureManagerProtocol {
    func save(_ model: Lecture) throws
    func fetch() throws -> [Lecture]
    func delete(_ model: Lecture) throws
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
