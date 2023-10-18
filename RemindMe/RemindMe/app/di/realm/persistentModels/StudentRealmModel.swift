//
//  StudentEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift

class StudentRealmModel: Object, StorageProtocol {
    typealias EntityType = Student

    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String = ""
    @Persisted var surname: String = ""
    @Persisted var birthDate: Date?
    @Persisted var sexId: Int?
    @Persisted var school: SchoolRealmModel?

    var title: String {
        return "\(name) \(surname)"
    }

    convenience init(id: String, name: String, surname: String, school: SchoolRealmModel?) {
        self.init()
        self.id = id
        self.name = name
        self.surname = surname
        self.school = school
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    required init(_ entity: Student) {
        super.init()
        id = entity.id
        name = entity.name
        surname = entity.surname
        if let entitySchool = entity.school {
            school = SchoolRealmModel(entitySchool)
        } else {
            school = nil
        }
    }

    func getModel() -> Student {
        var school: School?
        if let schoolEntity = self.school {
            school = School(id: schoolEntity.id, schoolName: schoolEntity.schoolName, schoolDescription: schoolEntity.schoolDescription, students: [])
        }

        return Student(id: id, name: name, surname: surname, school: school)
    }
}
