//
//  SchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@Model class SchoolPersistentModel: Identifiable, Hashable, DataEntity {
    typealias EntityType = School

    @Attribute(.unique) public var id: String = UUID().uuidString
    var title: String {
        return schoolName
    }

    var schoolName: String = ""
    var schoolCategoryId: Int?
    var schoolDescription: String = ""
    @Relationship(deleteRule: .cascade, inverse: \StudentPersistentModel.school) var students: [StudentPersistentModel]?

    required init(_ entity: School) {
        id = UUID().uuidString
        schoolName = entity.schoolName
        schoolCategoryId = entity.schoolCategoryId
        schoolDescription = entity.schoolDescription
    }

    init(schoolName: String, schoolCategoryId: Int? = nil, schoolDescription: String) {
        self.schoolName = schoolName
        self.schoolCategoryId = schoolCategoryId
        self.schoolDescription = schoolDescription
    }

    func getModel() -> School {
        return School(id: id, schoolName: schoolName, schoolDescription: schoolDescription, students: nil)
    }
}
