//
//  Student.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

class Student: StorageProtocol, Identifiable {
    typealias CommonType = StorageProtocol

    var id: String

    var name: String = ""
    var surname: String = ""
    var birthDate: Date?
    var sexId: Int?
    var school: School?

    init(id: String, name: String, surname: String, school: School?) {
        self.id = id
        self.name = name
        self.school = school
    }

    var title: String {
        return "\(name) \(surname)"
    }
}
