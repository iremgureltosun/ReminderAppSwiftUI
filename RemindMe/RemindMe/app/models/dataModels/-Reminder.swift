//
//  Event.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
struct ReminderHelper {
    
    func calculateDate(reminderSetting: ReminderModel) throws -> Date {
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
