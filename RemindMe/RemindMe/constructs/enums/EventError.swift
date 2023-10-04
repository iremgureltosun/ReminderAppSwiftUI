//
//  EventError.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

enum EventError: Error{
    case missingTime
    case missingIntervals
    case invalidRawValue
    case undefinedError
}
