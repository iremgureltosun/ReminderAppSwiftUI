//
//  SchoolEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift

class SchoolRealmModel: Object, StorageProtocol {
    typealias EntityType = School

    @Persisted(primaryKey: true) var id: String
    @Persisted var schoolName: String = ""
    @Persisted var schoolCategoryId: Int?
    @Persisted var schoolDescription: String = ""
    @Persisted var students: List<StudentRealmModel> = .init()

    convenience init(id: String, schoolName: String, schoolCategoryId: Int? = nil, schoolDescription: String) {
        self.init()
        self.id = id
        self.schoolName = schoolName
        self.schoolCategoryId = schoolCategoryId
        self.schoolDescription = schoolDescription
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    required init(_ entity: School) {
        super.init()
        id = entity.id
        schoolName = entity.schoolName
        schoolCategoryId = entity.schoolCategoryId
        schoolDescription = entity.schoolDescription
    }

    func getModel() -> School {
        return School(id: id, schoolName: schoolName, schoolDescription: schoolDescription, students: nil)
    }
}
