//
//  Reminder.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

class Reminder: CommonModel, ObservableObject, Identifiable {
    var id: String
    var title: String
    var body: String
    var repeatIntervalId: Int
    var intervals: [Int]?
    var date: Date?
    var time: Date?

    init(id: String, title: String, body: String, repeatIntervalId: Int, intervals: [Int]?, date: Date?, time: Date?) {
        self.id = id
        self.title = title
        self.body = body
        self.repeatIntervalId = repeatIntervalId
        self.intervals = intervals
        self.date = date
        self.time = time
    }

    public static func == (lhs: Reminder, rhs: Reminder) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.body == rhs.body
            && lhs.repeatIntervalId == rhs.repeatIntervalId
            && lhs.intervals == rhs.intervals
            && lhs.date == rhs.date
            && lhs.time == rhs.time
    }
}
