//
//  Student.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

class Student: CommonModelProtocol, ObservableObject, Identifiable, Hashable {
    var id: String
    var name: String = ""
    var surname: String = ""
    var birthDate: Date?
    var sexId: Int?
    var school: School?

    init(id: String, name: String, surname _: String, school: School?) {
        self.id = id
        self.name = name
        self.school = school
    }

    var title: String {
        return "\(name) \(surname)"
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
