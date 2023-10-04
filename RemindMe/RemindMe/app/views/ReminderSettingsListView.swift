//
//  ReminderListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

struct ReminderSettingsListView: View {
    @StateObject var viewModel = ReminderSettingsListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Button("Expand all \(Image(systemName: "chevron.right"))") {
                        withAnimation {
                            viewModel.expandAll(true)
                        }
                    }
                    .disabled(viewModel.allExpanded)
                    Button("Collapse all \(Image(systemName: "chevron.down"))") {
                        withAnimation {
                            viewModel.expandAll(false)
                        }
                    }
                    .disabled(viewModel.allCollapsed)
                }
                .padding()
                List {
                    ForEach($viewModel.repeatIntervalModelList, id: \.repeatInterval.rawValue) { $interval in
                        DisclosureGroup(isExpanded: $interval.expanded) {
                            ForEach(viewModel.intervalsDictionary[interval] ?? []) { option in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(option.interval.title)
                                        Spacer()
                                        Checkbox(selected: viewModel.selectedInterval == interval) {
                                            viewModel.setSelectedInterval(selectedInterval: interval)
                                        }
                                    }
                                }
                            }
                        } label: {
                            HStack {
                                Text(interval.repeatInterval.title)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
                            }
                            .font(.title3)
                            .onTapGesture {
                                interval.expanded.toggle()
                                viewModel.setSelectedInterval(selectedInterval: interval)
                                withAnimation { viewModel.collapseAllExceptSelectedOne() }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                viewModel.loadIntervals()
                viewModel.loadOptions()
                viewModel.loadDict()
            }
            .navigationBarTitle("Reminder Settings")
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ReminderSettingsListView()
}
