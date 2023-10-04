//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftData

@Model final public class ReminderModel: Identifiable {
    @Attribute(.unique) public var id: String = UUID().uuidString
    var title: String
    var body: String
    var repeatIntervalId: Int
    var intervals: [Int]?
    var date: Date?
    var time: Date?
    
    init(title: String,body: String, repeatIntervalId: Int, intervals: [Int]?, date: Date?, time: Date?) {
        self.title = title
        self.body = body
        self.repeatIntervalId = repeatIntervalId
        self.intervals = intervals
        self.date = date
        self.time = time
    }
}
