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
            VStack(spacing: 15) {
                TextField("Enter title", text: $viewModel.title)

                TextField("Enter body", text: $viewModel.body)

                timePickerView

                expandCollapseButtonsView

                listView

                PillShapedButton(text: "Save") {
                    do {
                        let selectionItems = try viewModel.getSelectedItems()

                        // viewModel.reminder =
                    } catch {
                    }
                }
                .padding()
            }
            .padding(.horizontal, 20)
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
            .foregroundColor(Color.offWhite)
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
    }

    @ViewBuilder private var listView: some View {
        List {
            ForEach($viewModel.repeatIntervalModelList, id: \.repeatInterval.rawValue) { $sectionHeader in
                DisclosureGroup(isExpanded: $sectionHeader.expanded) {
                    ForEach(viewModel.intervalsDictionary[sectionHeader] ?? [], id: \.id) { item in
                        VStack(alignment: .leading) {
                            IntervalItemSelectionView(item: item)
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
