//
//  ReminderListViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation
import SwiftUI

final class InsertReminderViewModel: BasePersistentViewModel {
    @Published var intervalsDictionary: [IntervalSection: [IntervalItem]] = [:]
    @Published var repeatIntervalModelList: [IntervalSection] = []
    @Published var intervalItems: [IntervalItem] = []
    @Published var selectedSection: IntervalSection?
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var reminder: ReminderModel? = nil
    @Published var selectedDate: Date = Date()
    @Published var showDate = false
    @Inject var reminderReminderPersistenceManager: ReminderPersistenceManagerProtocol

    func setSelectedIntervalSectionHeader(selectedSection: IntervalSection) {
        self.selectedSection = selectedSection
        showDate = selectedSection.repeatInterval == RepeatIntervals.once
    }

    func getCheckedItemsOfSelectedSection() throws -> [IntervalItem] {
        guard let selectedSection = selectedSection else { throw PersistenceError.sectionNotSelected }
        let selectionItems = intervalsDictionary[selectedSection]?.filter { $0.checked == true }
        guard let selectionItems = selectionItems, !selectionItems.isEmpty else {
            throw PersistenceError.itemNotSelected
        }
        return selectionItems
    }
}

// MARK: Reminder creation

extension InsertReminderViewModel {
    func create() throws -> ReminderModel? {
        guard let intervalId = selectedSection?.repeatInterval.rawValue else { throw PersistenceError.sectionNotSelected
        }
        let selectedItems = try getCheckedItemsOfSelectedSection().map { $0.id }
        if selectedSection?.repeatInterval == RepeatIntervals.daily || selectedSection?.repeatInterval == RepeatIntervals.monthly {
            return ReminderModel(title: title, body: body, repeatIntervalId: intervalId, intervals: selectedItems, date: nil, time: selectedDate)
        } else {
            let reminder = ReminderModel(title: title, body: body, repeatIntervalId: intervalId, intervals: nil, date: selectedDate, time: nil)
            return reminder
        }
    }

    func save() {
        do {
            guard let reminder = try create() else {
                throw PersistenceError.unknownError
            }
            try reminderReminderPersistenceManager.save(reminder)
            showSuccess = true
        } catch {
            showAlert = true
            if let error = error as? PersistenceError {
                errorMessage = error.description
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}

// MARK: Expand of collapse disclosure group

extension InsertReminderViewModel {
    var allExpanded: Bool {
        repeatIntervalModelList.allSatisfy { $0.expanded }
    }

    var allCollapsed: Bool {
        repeatIntervalModelList.allSatisfy { !$0.expanded }
    }

    func expandAll(_ expand: Bool) {
        repeatIntervalModelList.indices.forEach {
            repeatIntervalModelList[$0].expanded = expand
        }
    }

    func collapseAllExceptSelectedOne() {
        let collapseList = repeatIntervalModelList.filter { $0.repeatInterval.rawValue != selectedSection?.repeatInterval.rawValue }
        for i in 0 ..< repeatIntervalModelList.count {
            if collapseList.contains(repeatIntervalModelList[i]) {
                repeatIntervalModelList[i].expanded = false
            }
        }
    }
}

// MARK: Loading functions

extension InsertReminderViewModel {
    func loadIntervals() {
        repeatIntervalModelList.removeAll()
        for interval in RepeatIntervals.allCases {
            repeatIntervalModelList.append(IntervalSection(repeatInterval: interval, expanded: false))
        }
    }

    func loadOptions() {
        intervalItems.removeAll()
        for sectionHeader in DailyInterval.allCases {
            intervalItems.append(IntervalItem(id: sectionHeader.id, sectionHeader: sectionHeader))
        }
        for sectionHeader in MonthlyInterval.allCases {
            intervalItems.append(IntervalItem(id: sectionHeader.id, sectionHeader: sectionHeader))
        }
        for sectionHeader in OnceInterval.allCases {
            intervalItems.append(IntervalItem(id: sectionHeader.id, sectionHeader: sectionHeader))
        }
    }

    func loadDict() {
        intervalsDictionary.removeAll()
        intervalsDictionary = Dictionary(grouping: intervalItems) { IntervalSection(repeatInterval: $0.sectionHeader.repeatIntervalType, expanded: true) }
    }
}
