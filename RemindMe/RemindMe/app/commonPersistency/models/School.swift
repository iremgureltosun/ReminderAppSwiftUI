//
//  School.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

class School: StorageProtocol, Identifiable{
    public typealias CommonType = StorageProtocol

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
   
}
