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

    func loadItems() {
        do {
            list = try ListViewModel(modelContext: modelContext).studentReminderPersistenceManager.fetch()
        } catch {
            list = []
        }
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