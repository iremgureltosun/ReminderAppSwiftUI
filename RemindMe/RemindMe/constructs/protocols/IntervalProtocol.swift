//
//  IntervalProtocol.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

protocol IntervalProtocol: CaseIterable {
    var id: Int { get }
    var repeatIntervalType: RepeatIntervals { get }
    var title: String { get }
}
