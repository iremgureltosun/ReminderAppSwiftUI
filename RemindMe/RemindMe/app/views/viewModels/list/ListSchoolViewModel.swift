//
//  SchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftUI

final class ListSchoolViewModel: BasePersistentViewModel {
    @Published var list: [School] = []
    @Inject var storageManager: SchoolStorageProtocol

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
