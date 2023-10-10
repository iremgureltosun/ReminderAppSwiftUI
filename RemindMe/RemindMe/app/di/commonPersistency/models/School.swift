//
//  School.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

class School: DataModel, ObservableObject, Identifiable, Hashable {
    var id: String
    var schoolName: String = ""
    var schoolCategoryId: Int?
    var schoolDescription: String = ""
    var students: [Student]?

    init(id: String, schoolName: String, schoolCategoryId: Int? = nil, schoolDescription: String, students: [Student]?) {
        self.id = id
        self.schoolName = schoolName
        self.schoolCategoryId = schoolCategoryId
        self.schoolDescription = schoolDescription
        self.students = students
    }

    var title: String {
        return schoolName
    }

    static func == (lhs: School, rhs: School) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
