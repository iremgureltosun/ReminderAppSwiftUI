//
//  SchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@Model class SchoolPersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = School

    @Attribute(.unique) public var id: String
    var title: String {
        return schoolName
    }

    var schoolName: String = ""
    var schoolCategoryId: Int?
    var schoolDescription: String = ""
    @Relationship(deleteRule: .cascade, inverse: \StudentPersistentModel.school) var students: [StudentPersistentModel]?

    required init(_ entity: School) {
        id = entity.id
        schoolName = entity.schoolName
        schoolCategoryId = entity.schoolCategoryId
        schoolDescription = entity.schoolDescription
    }

    init(id: String, schoolName: String, schoolCategoryId: Int? = nil, schoolDescription: String) {
        self.id = id
        self.schoolName = schoolName
        self.schoolCategoryId = schoolCategoryId
        self.schoolDescription = schoolDescription
    }

    func getModel() -> School {
        return School(id: id, schoolName: schoolName, schoolDescription: schoolDescription, students: nil)
    }
}
