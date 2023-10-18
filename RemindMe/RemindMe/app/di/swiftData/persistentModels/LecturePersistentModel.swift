//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model class LecturePersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = Lecture

    @Attribute(.unique) public var id: String
    public var title: String
    var subtitle: String

    required init(_ entity: Lecture) {
        id = entity.id
        title = entity.title
        subtitle = entity.subtitle
    }

    init(id: String, title: String, subtitle: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
    }

    func getModel() -> Lecture {
        return Lecture(id: id, title: title, subtitle: subtitle)
    }
}
