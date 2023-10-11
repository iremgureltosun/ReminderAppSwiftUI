//
//  ReminderEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation
import RealmSwift

class ReminderRealmModel: Object, DataEntity {
    typealias EntityType = Reminder

    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var body: String = ""
    @Persisted var repeatIntervalId: Int = 0
    @Persisted var intervals: List<Int> = List<Int>()
    @Persisted var date: Date?
    @Persisted var time: Date?

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init(title: String, body: String, repeatIntervalId: Int, intervals: List<Int>, date: Date?, time: Date?) {
        self.init()
        self.title = title
        self.body = body
        self.repeatIntervalId = repeatIntervalId
        self.intervals = intervals
        self.date = date
        self.time = time
    }

    required init(_ entity: Reminder) {
        title = entity.title
        body = entity.body
        repeatIntervalId = entity.repeatIntervalId
        let list = List<Int>()
        for intValue in entity.intervals ?? [] {
            list.append(intValue)
        }

        intervals = list
        date = entity.date
        time = entity.time
    }

    func getDataModel()-> Reminder {
        var list: [Int] = []
        for intValue in intervals {
            list.append(intValue)
        }

        return Reminder(id: id, title: title, body: body, repeatIntervalId: repeatIntervalId, intervals: list, date: date, time: time)
    }
}
