////
////  StoredRemindersListView.swift
////  RemindMe
////
////  Created by Tosun, Irem on 4.10.2023.
////

import Foundation
import SwiftUI

final class ListLectureViewModel: BasePersistentViewModel {
    @Published var list: [Lecture] = []
    @Inject var storageManager: LectureStorageProtocol
    @Published var itemToEdit: Lecture?

    func loadItems() {
        do {
            list = try storageManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try indexSet.forEach { index in
            let item = list[index]
            try storageManager.delete(item)
        }
    }
}
