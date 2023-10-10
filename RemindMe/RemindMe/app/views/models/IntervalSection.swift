//
//  RepeatIntervalModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

struct IntervalSection: Hashable {
    var id: UUID = UUID()
    var repeatInterval: RepeatIntervals
    var expanded: Bool
}
