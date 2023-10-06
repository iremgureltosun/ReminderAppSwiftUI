//
//  SchoolViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class ListSchoolViewModel: BasePersistentViewModel {
    @Published var list: [SchoolModel] = []
    var schoolPersistenceManager: SchoolPersistenceManagerProtocol = Inject().wrappedValue

    func loadItems() {
        do {
            list = try schoolPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try schoolPersistenceManager.delete(indexSet: indexSet)
    }
}
