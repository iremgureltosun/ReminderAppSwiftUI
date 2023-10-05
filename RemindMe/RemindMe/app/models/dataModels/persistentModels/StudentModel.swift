//
//  StudentModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData

@Model public class StudentModel: PersistentProtocol, Identifiable {
    public typealias PersistentType = PersistentProtocol

    @Attribute(.unique) public var id: String = UUID().uuidString
    public var title: String {
        return "\(name) \(surname)"
    }

    var name: String = ""
    var surname: String = ""
    var birthDate: Date?
    var sexId: Int?

    init(name: String, surname: String) {
        id = id
        self.name = name
    }
}
