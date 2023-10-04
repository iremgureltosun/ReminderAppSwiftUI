//
//  BaseReminderService.swift
//  RemindMe
//
//  Created by Tosun, Irem on 22.09.2023.
//

import Foundation
import UserNotifications
import SwiftUI

class BaseReminderService<T> where T: RemindMeProtocol {
    typealias ReminderType = T.Type
   
    private let userNotificationCenter = UNUserNotificationCenter.current()
    private let defaultOptions: UNAuthorizationOptions = [.badge, .alert, .sound]
    


//    func saveNotification<T: RemindMeProtocol>() async throws {
//        
//    }
    
    func disableNotifications() {
        
    }

    func enableNotifications() {
        
    }
}
