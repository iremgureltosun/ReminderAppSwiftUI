//
//  ReminderEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift

class LectureRealmModel: Object, StorageProtocol {
    typealias EntityType = Lecture

    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String = ""
    @Persisted var subtitle: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(id: String, title: String, subtitle: String) {
        self.init()
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }

    required init(_ entity: Lecture) {
        super.init()
        id = entity.id
        title = entity.title
        subtitle = entity.subtitle
    }

    func getModel() -> Lecture {
        return Lecture(id: id, title: title, subtitle: subtitle)
    }
}
