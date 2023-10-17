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
    @Inject var schoolPersistenceManager: SchoolManagerProtocol

    func loadItems() {
        do {
            list = try schoolPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(item: School) throws {
        try schoolPersistenceManager.delete(item)
    }
}
