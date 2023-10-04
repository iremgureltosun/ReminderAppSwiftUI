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
                timePickerView

                expandCollapseButtonsView

                listView

                PillShapedButton(text: "Save") {
                }
                .padding()
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

    @ViewBuilder private var timePickerView: some View {
        RoundedRectangle(cornerRadius: 18)
            .frame(height: 50)
            .padding()
            .foregroundColor(Color.offWhite)
            .shadow(radius: 8)
            .overlay {
                TimerView()
            }
    }

    @ViewBuilder private var expandCollapseButtonsView: some View {
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
    }

    @ViewBuilder private var listView: some View {
        List {
            ForEach($viewModel.repeatIntervalModelList, id: \.repeatInterval.rawValue) { $sectionHeader in
                DisclosureGroup(isExpanded: $sectionHeader.expanded) {
                    ForEach(viewModel.intervalsDictionary[sectionHeader] ?? [], id: \.id) { item in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.sectionHeader.title)
                                Spacer()
                                IntervalItemSelectionView(item: item)
                            }
                        }
                    }
                } label: {
                    HStack {
                        Text(sectionHeader.repeatInterval.title)
                            .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
                    }
                    .font(.title3)
                    .onTapGesture {
                        sectionHeader.expanded.toggle()
                        viewModel.setSelectedIntervalSectionHeader(selectedSection: sectionHeader)
                        withAnimation { viewModel.collapseAllExceptSelectedOne() }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ReminderSettingsListView()
}
