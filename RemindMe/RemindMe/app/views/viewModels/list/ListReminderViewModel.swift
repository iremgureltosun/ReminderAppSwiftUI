////
////  StoredRemindersListView.swift
////  RemindMe
////
////  Created by Tosun, Irem on 4.10.2023.
////
//
//import Foundation
//import SwiftUI
//
//final class ListReminderViewModel: BasePersistentViewModel {
//    @Published var list: [Reminder] = []
//    @Inject private var reminderReminderPersistenceManager: ReminderManagerProtocol
//
//    func loadItems() {
//        do {
//            list = try reminderReminderPersistenceManager.fetch()
//        } catch {
//            list = []
//        }
//    }
//
//    func delete(indexSet: IndexSet) throws {
//        try indexSet.forEach { index in
//            let item = list[index]
//            try reminderReminderPersistenceManager.delete(item)
//        }
//    }
//}
