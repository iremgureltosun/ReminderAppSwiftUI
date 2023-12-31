//
//  ListStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftUI

final class ListStudentViewModel: BasePersistentViewModel {
    @Published var list: [Student] = []
    @Inject var storageManager: StudentStorageProtocol
    @Published var studentToEdit: Student?

    func loadItems() {
        do {
            list = try storageManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(_ item: Student) throws {
        try storageManager.delete(item)
    }
}
