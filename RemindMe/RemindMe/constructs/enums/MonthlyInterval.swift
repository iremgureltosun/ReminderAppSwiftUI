//
//  MonthlyInterval.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

enum MonthlyInterval: Int, IntervalProtocol {
    var id: Int {
        return rawValue
    }

    var repeatIntervalType: RepeatIntervals {
        return RepeatIntervals.monthly
    }

    var title: String {
        switch self {
        case .beginningOfMonth:
            return "Beginning of month"
        case .endOfMonth:
            return "End of month"
        case .middleOfMonth:
            return "Middle of month"
        }
    }

    case beginningOfMonth = 8
    case middleOfMonth = 9
    case endOfMonth = 10
}
