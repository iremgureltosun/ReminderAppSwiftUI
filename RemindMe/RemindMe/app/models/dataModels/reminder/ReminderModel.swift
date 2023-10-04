//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftData

@Model final public class ReminderModel: Identifiable {
    @Attribute(.unique) public var id: String
    var title: String
    var repeatIntervalId: Int
    var intervals: [Int]?
    var time: Date?
    
    init(id: String, title: String, repeatIntervalId: Int, intervals: [Int]?, time: Date?) {
        self.id = id
        self.title = title
        self.repeatIntervalId = repeatIntervalId
        self.intervals = intervals
        self.time = time
    }
}
