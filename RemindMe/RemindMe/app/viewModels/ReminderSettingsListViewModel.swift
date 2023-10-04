//
//  ReminderListViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import Foundation

@MainActor
final class ReminderSettingsListViewModel: ObservableObject {
    @Published var intervalsDictionary: [RepeatIntervalModel: [IntervalOptionModel]] = [:]
    @Published var repeatIntervalModelList: [RepeatIntervalModel] = []
    @Published var intervalOptions: [IntervalOptionModel] = []
    @Published var selectedInterval: RepeatIntervalModel?

    var allExpanded: Bool {
        repeatIntervalModelList.allSatisfy { $0.expanded }
    }

    var allCollapsed: Bool {
        repeatIntervalModelList.allSatisfy { !$0.expanded }
    }

    func loadIntervals() {
        for interval in RepeatIntervals.allCases {
            repeatIntervalModelList.append(RepeatIntervalModel(repeatInterval: interval, expanded: false))
        }
    }

    func loadOptions() {
        for interval in DailyInterval.allCases {
            intervalOptions.append(IntervalOptionModel(interval: interval))
        }
        for interval in MonthlyInterval.allCases {
            intervalOptions.append(IntervalOptionModel(interval: interval))
        }
        for interval in OnceInterval.allCases {
            intervalOptions.append(IntervalOptionModel(interval: interval))
        }
    }

    func loadDict() {
        intervalsDictionary = Dictionary(grouping: intervalOptions) { RepeatIntervalModel(repeatInterval: $0.interval.repeatIntervalType, expanded: true) }
    }

    func expandAll(_ expand: Bool) {
        repeatIntervalModelList.indices.forEach {
            repeatIntervalModelList[$0].expanded = expand
        }
    }

    func collapseAllExceptSelectedOne() {
        let collapseList = repeatIntervalModelList.filter { $0.repeatInterval.rawValue != selectedInterval?.repeatInterval.rawValue }
        for i in 0 ..< repeatIntervalModelList.count {
            if collapseList.contains(repeatIntervalModelList[i]) {
                repeatIntervalModelList[i].expanded = false
            }
        }
    }

    func setSelectedInterval(selectedInterval: RepeatIntervalModel) {
        self.selectedInterval = selectedInterval
    }
}
