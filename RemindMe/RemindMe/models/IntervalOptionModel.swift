//
//  IntervalOptionModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

struct IntervalOptionModel: Identifiable {
    var id: UUID = UUID()
    var interval: any IntervalProtocol
}
