//
//  RemindMeProtocol.swift
//  RemindMe
//
//  Created by Tosun, Irem on 22.09.2023.
//

import Foundation

protocol RemindMeProtocol{
    associatedtype ReminderType
    static func getRequestUrl(startDate: String?, endDate: String?) throws -> URLRequest?
}
