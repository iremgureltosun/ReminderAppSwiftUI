//
//  RepeatIntervals.swift
//  RemindMe
//
//  Created by Tosun, Irem on 22.09.2023.
//

import Foundation

enum RepeatIntervals: Int, CaseIterable {
    case daily = 1
    case monthly = 2
    case once = 3

    var title: String {
        switch self {
        case .daily: return "Daily"
        case .monthly: return "Monthly"
        case .once: return "Once"
        }
    }
}
