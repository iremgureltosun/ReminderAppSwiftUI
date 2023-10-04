//
//  ReminderListViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

@MainActor
final class ReminderSettingsListViewModel: ObservableObject {
    @Published var intervalsDictionary: [IntervalSection: [IntervalItem]] = [:]
    @Published var repeatIntervalModelList: [IntervalSection] = []
    @Published var intervalItems: [IntervalItem] = []
    @Published var selectedSection: IntervalSection?
    @Published var title: String = ""
    @Published var body: String = ""
    @Published var reminder: ReminderModel?
    @Published var selectedDate: Date = Date()
    @Published var showDate = false
    
    var allExpanded: Bool {
        repeatIntervalModelList.allSatisfy { $0.expanded }
    }

    var allCollapsed: Bool {
        repeatIntervalModelList.allSatisfy { !$0.expanded }
    }

    func loadIntervals() {
        for interval in RepeatIntervals.allCases {
            repeatIntervalModelList.append(IntervalSection(repeatInterval: interval, expanded: false))
        }
    }

    func loadOptions() {
        for sectionHeader in DailyInterval.allCases {
            intervalItems.append(IntervalItem(sectionHeader: sectionHeader))
        }
        for sectionHeader in MonthlyInterval.allCases {
            intervalItems.append(IntervalItem(sectionHeader: sectionHeader))
        }
        for sectionHeader in OnceInterval.allCases {
            intervalItems.append(IntervalItem(sectionHeader: sectionHeader))
        }
    }

    func loadDict() {
        intervalsDictionary = Dictionary(grouping: intervalItems) { IntervalSection(repeatInterval: $0.sectionHeader.repeatIntervalType, expanded: true) }
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

    func setSelectedIntervalSectionHeader(selectedSection: IntervalSection) {
        self.selectedSection = selectedSection
        self.showDate = selectedSection.repeatInterval == RepeatIntervals.once
    }

    func getSelectedItems() throws -> [IntervalItem] {
        guard let selectedSection = selectedSection else{throw ReminderSettingsError.sectionNotSelected}
        let selectionItems = intervalsDictionary[selectedSection]?.filter { $0.checked == true }
        guard let selectionItems = selectionItems,  !selectionItems.isEmpty else{
            throw ReminderSettingsError.itemNotSelected
        }
        return selectionItems
    }
}
