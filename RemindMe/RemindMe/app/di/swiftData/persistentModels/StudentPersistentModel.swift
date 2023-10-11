//
//  StudentModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@Model class StudentPersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = Student

    @Attribute(.unique) public var id: String = UUID().uuidString
    var title: String {
        return "\(name) \(surname)"
    }

    var name: String = ""
    var surname: String = ""
    var birthDate: Date?
    var sexId: Int?
    var school: SchoolPersistentModel?

    required init(_ entity: Student) {
        id = UUID().uuidString
        name = entity.name
        surname = entity.surname
        if let sch = entity.school {
            school = SchoolPersistentModel(sch)
        } else {
            school = nil
        }
    }

    init(name: String, surname: String, school: SchoolPersistentModel?) {
        self.name = name
        self.surname = surname
        self.school = school
    }

    func getModel()-> Student {
        var school: School?
        if let sch = self.school {
            school = School(id: sch.id, schoolName: sch.schoolName, schoolDescription: sch.schoolDescription, students: nil)
        } else {
            school = nil
        }
        return Student(id: id, name: name, surname: surname, school: school)
    }
}
