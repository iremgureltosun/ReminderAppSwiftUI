//
//  Once.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

enum OnceInterval: Int, IntervalProtocol {
    var id: Int {
        return rawValue
    }

    var repeatIntervalType: RepeatIntervals {
        return RepeatIntervals.once
    }

    var title: String {
        switch self {
        case .once:
            return "Occur once"
        }
    }
    case once = 11
}
