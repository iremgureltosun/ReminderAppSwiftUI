//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftData

@Model public final class Reminder: Identifiable {
    @Attribute(.unique) public var id: String
    var title: String
    var body: String
    var reminderSetting: ReminderSetting

    init(title: String, body: String, reminderSetting: ReminderSetting) {
        id = UUID().uuidString
        self.title = title
        self.body = body
        self.reminderSetting = reminderSetting
    }

    func calculateDate() throws -> Date {
        if let repeatInterval = RepeatIntervals(rawValue: reminderSetting.repeatIntervalId) {
            switch repeatInterval {
            case .once:
                guard let time = reminderSetting.time else {
                    throw EventError.missingTime
                }
                let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: time)
                let startOfToday = Date().startOfDay

                guard let hour = dateComponents.hour, let min = dateComponents.minute, let date = startOfToday.adding(hour, to: .hour)?.adding(min, to: .minute) else {
                    throw EventError.undefinedError
                }
                return date

            case .daily:
                guard let intervals = reminderSetting.intervals else {
                    throw EventError.missingIntervals
                }
                return Date() // TODO:

            case .monthly:
                return Date() // TODO:
            }
        } else {
            throw EventError.invalidRawValue
        }
    }
}
