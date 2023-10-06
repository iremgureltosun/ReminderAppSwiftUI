//
//  ListStudentViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

final class ListStudentViewModel: BasePersistentViewModel {
    @Published var list: [StudentModel] = []
    var model: ListViewModel?
    
    func loadContext() {
        model = ListViewModel(modelContext: modelContext)
    }

    func loadItems() {
        do {
            list = try model?.studentReminderPersistenceManager.fetch() ?? []
        } catch {
            list = []
        }
    }

    func delete(indexSet: IndexSet) throws {
        try model?.studentReminderPersistenceManager.delete(indexSet: indexSet)
    }

    @MainActor
    struct ListViewModel {
        var studentReminderPersistenceManager: StudentPersistenceManagerProtocol
        var modelContext: ModelContext

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            studentReminderPersistenceManager = Inject(context: modelContext).wrappedValue
        }
    }
}
