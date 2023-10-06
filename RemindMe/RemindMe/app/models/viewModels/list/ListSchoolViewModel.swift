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

    var model: ListViewModel?
    
    func loadContext() {
        model = ListViewModel(modelContext: modelContext)
    }
    
    func loadItems() {
        do {
            list = try ListViewModel(modelContext: modelContext).schoolPersistenceManager.fetch()
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try model?.schoolPersistenceManager.delete(indexSet: indexSet)
    }
    
    @MainActor
    struct ListViewModel {
        var schoolPersistenceManager: SchoolPersistenceManagerProtocol
        var modelContext: ModelContext

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            schoolPersistenceManager = Inject(context: modelContext).wrappedValue
        }
    }
}
