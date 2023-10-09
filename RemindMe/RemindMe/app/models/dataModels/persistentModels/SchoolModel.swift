//
//  SchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@Model public class SchoolModel: PersistentProtocol, Identifiable{
    public typealias PersistentType = PersistentProtocol

    @Attribute(.unique) public var id: String = UUID().uuidString
    public var title: String {
        return schoolName
    }

    var schoolName: String = ""
    var schoolCategoryId: Int?
    var schoolDescription: String = ""
    @Relationship(deleteRule: .cascade, inverse: \StudentModel.school) var students: [StudentModel]?
    
    init(schoolName: String, schoolCategoryId: Int? = nil, schoolDescription: String) {
        self.schoolName = schoolName
        self.schoolCategoryId = schoolCategoryId
        self.schoolDescription = schoolDescription
    }
}
