//
//  SchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model class SchoolPersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = School

    @Attribute(.unique) public var id: String
    var title: String {
        return schoolName
    }

    var schoolName: String
    var schoolCategoryId: Int?
    var schoolDescription: String?
    @Relationship(deleteRule: .cascade, inverse: \StudentPersistentModel.school) var students: [StudentPersistentModel]

    required init(_ entity: School) {
        id = entity.id
        schoolName = entity.schoolName
        schoolCategoryId = entity.schoolCategoryId
        schoolDescription = entity.schoolDescription
        var list: [StudentPersistentModel] = []
        for student in entity.students {
            list.append(StudentPersistentModel(student))
        }

        students = list
    }

    init(id: String,
         schoolName: String,
         schoolCategoryId: Int?,
         schoolDescription: String?,
         students: [StudentPersistentModel])
    {
        self.id = id
        self.schoolName = schoolName
        self.schoolCategoryId = schoolCategoryId
        self.schoolDescription = schoolDescription
        self.students = students
    }

    func getModel() -> School {
        let school = School(id: id, schoolName: schoolName, schoolDescription: schoolDescription, students: [])
        var list: [Student] = []

        for student in students {
            list.append(student.getModel())
        }

        school.students = list
        return school
    }
}
