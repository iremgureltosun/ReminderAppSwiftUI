//
//  ReminderSettingsError.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation

enum ReminderSettingsError: Error{
    case sectionNotSelected
    case itemNotSelected
    
    var description: String{
        switch self {
        case .sectionNotSelected:
            "Please select a section."
        case .itemNotSelected:
            "Please select at least one interval."
        }
    }
}
