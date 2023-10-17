//
//  DailyInterval.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

enum DailyInterval: Int, IntervalProtocol {
    var id: Int {
        return rawValue
    }

    var repeatIntervalType: RepeatIntervals {
        return RepeatIntervals.daily
    }

    var title: String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }

    case monday = 1
    case tuesday = 2
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}
