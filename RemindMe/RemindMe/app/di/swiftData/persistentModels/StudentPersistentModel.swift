//
//  StudentModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model class StudentPersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = Student

    @Attribute(.unique) public var id: String
    var title: String {
        return "\(name) \(surname)"
    }

    var name: String
    var surname: String
    var birthDate: Date?
    var sexId: Int?
    var school: SchoolPersistentModel?

    required init(_ entity: Student) {
        id = entity.id
        name = entity.name
        surname = entity.surname
        birthDate = entity.birthDate
        sexId = entity.sexId
        if let sch = entity.school {
            school = SchoolPersistentModel(sch)
        } else {
            school = nil
        }
    }

    init(id: String, title _: String, name: String, surname: String, birthDate: Date?, sexId: Int?, school: SchoolPersistentModel?) {
        self.id = id
        self.name = name
        self.surname = surname
        self.birthDate = birthDate
        self.sexId = sexId
        self.school = school
    }

    func getModel() -> Student {
        var school: School?
        if let sch = self.school {
            var list: [Student] = []

            for entity in sch.students {
                list.append(Student(id: entity.id, name: entity.name, surname: entity.surname, school: nil))
            }

            school = School(id: sch.id, schoolName: sch.schoolName, schoolDescription: sch.schoolDescription, students: list)
        } else {
            school = nil
        }
        return Student(id: id, name: name, surname: surname, school: school)
    }
}
