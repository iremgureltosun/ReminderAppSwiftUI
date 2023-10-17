//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftData

@Model class ReminderPersistentModel: Identifiable, Hashable, StorageProtocol {
    typealias EntityType = Reminder

    @Attribute(.unique) public var id: String
    public var title: String
    var body: String
    var repeatIntervalId: Int
    var intervals: [Int]?
    var date: Date?
    var time: Date?

    required init(_ entity: Reminder) {
        id = entity.id
        title = entity.title
        body = entity.body
        repeatIntervalId = entity.repeatIntervalId
        intervals = entity.intervals
        date = entity.date
        time = entity.time
    }

    init(id: String, title: String, body: String, repeatIntervalId: Int, intervals: [Int]?, date: Date?, time: Date?) {
        self.id = id
        self.title = title
        self.body = body
        self.repeatIntervalId = repeatIntervalId
        self.intervals = intervals
        self.date = date
        self.time = time
    }

    func getModel() -> Reminder {
        return Reminder(id: id, title: title, body: body, repeatIntervalId: repeatIntervalId, intervals: intervals, date: date, time: time)
    }
}
