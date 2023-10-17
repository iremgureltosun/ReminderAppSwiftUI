//
//  Lesson.swift
//  RemindMe
//
//  Created by Tosun, Irem on 17.10.2023.
//

import Foundation

class Lecture: CommonModelProtocol, ObservableObject, Identifiable, Hashable {
    var id: String
    var title: String = ""
    var subtitle: String = ""

    init(id: String, title: String, subtitle: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }

    static func == (lhs: Lecture, rhs: Lecture) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
