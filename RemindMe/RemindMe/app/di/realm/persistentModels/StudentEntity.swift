//
//  StudentEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift

class StudentEntity: Object, DataEntity {
    typealias EntityType = Student

    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String = ""
    @Persisted var surname: String = ""
    @Persisted var birthDate: Date?
    @Persisted var sexId: Int?
    @Persisted var school: SchoolEntity?

    var title: String {
        return "\(name) \(surname)"
    }

    convenience init(name: String, surname: String, school: SchoolEntity?) {
        self.init()
        self.name = name
        self.surname = surname
        self.school = school
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    required init(_ entity: Student) {
        name = entity.name
        surname = entity.surname
        if let entitySchool = entity.school {
            school = SchoolEntity(entitySchool)
        } else {
            school = nil
        }
    }

    func getDataModel() -> Student {
        var school: School?
        if let schoolEntity = self.school {
            // var students: []
            school = School(id: schoolEntity.id, schoolName: schoolEntity.schoolName, schoolDescription: schoolEntity.schoolDescription, students: nil)
        }

        return Student(id: id, name: name, surname: surname, school: school)
    }
}
