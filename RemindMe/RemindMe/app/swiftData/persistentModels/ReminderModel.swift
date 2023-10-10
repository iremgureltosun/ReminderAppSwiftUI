//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftData

@Model class ReminderModel: Identifiable, Hashable, CommonDataProtocol {
    typealias EntityType = Reminder

    @Attribute(.unique) public var id: String = UUID().uuidString
    public var title: String
    var body: String
    var repeatIntervalId: Int
    var intervals: [Int]?
    var date: Date?
    var time: Date?

    required init(_ entity: Reminder) {
        title = entity.title
        body = entity.body
        repeatIntervalId = entity.repeatIntervalId
        intervals = entity.intervals
        date = entity.date
        time = entity.time
    }

    init(title: String, body: String, repeatIntervalId: Int, intervals: [Int]?, date: Date?, time: Date?) {
        self.title = title
        self.body = body
        self.repeatIntervalId = repeatIntervalId
        self.intervals = intervals
        self.date = date
        self.time = time
    }

    func getDataModel()-> Reminder{
        return Reminder(id: self.id, title: self.title, body: self.body, repeatIntervalId: self.repeatIntervalId, intervals: self.intervals, date: self.date, time: self.time)
    }
}
