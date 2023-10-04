//
//  ReminderListView.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

struct ReminderSettingsListView: View {
    @StateObject var viewModel = ReminderSettingsListViewModel()
    @State private var showSuccess = false
    @State private var showAlert = false
    @State private var errorMessage = "An undefined error occurred."

    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                TextField("Enter title", text: $viewModel.title)

                TextField("Enter body", text: $viewModel.body)

                dateAndTimeSelectionView

                Divider()

                expandCollapseButtonsView

                listView

                PillShapedButton(text: "Save") {
                    saveReminder()
                }
                .padding()
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .alert(isPresented: $showSuccess) {
                Alert(
                    title: Text("Success"),
                    message: Text("Reminder saved successfully"),
                    dismissButton: .default(Text("OK"))
                )
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

    private func saveReminder() {
        do {
            try viewModel.saveReminder()
            showSuccess = true
        } catch {
            showAlert = true
            if let error = error as? ReminderSettingsError {
                errorMessage = error.description
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }

    @ViewBuilder private var dateAndTimeSelectionView: some View {
        HStack {
            Spacer()
            datePickerView
                .opacity(viewModel.showDate == true ? 1 : 0)

            timePickerView
            Spacer()
        }
    }

    @ViewBuilder private var datePickerView: some View {
        DatePicker("Select a date", selection: $viewModel.selectedDate, displayedComponents: .date)
            .background(Color.clear) // Make the background transparent
            .accentColor(.blue) // Set the text color to blue
            .padding()
            .labelsHidden()
    }

    @ViewBuilder private var timePickerView: some View {
        DatePicker("Select a date", selection: $viewModel.selectedDate, displayedComponents: .hourAndMinute)
            .background(Color.clear) // Make the background transparent
            .accentColor(.blue) // Set the text color to blue
            .padding()
            .labelsHidden()
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
                        Spacer()

                        Image(systemName: sectionHeader.expanded ? "chevron.down" : "chevron.right")
                            .imageScale(.small)
                            .rotationEffect(.degrees(sectionHeader.expanded ? 0 : 90))
                            .foregroundColor(.blue) // Adjust the color as needed
                            .onTapGesture {
                                sectionHeader.expanded.toggle()
                                viewModel.setSelectedIntervalSectionHeader(selectedSection: sectionHeader)
                                withAnimation { viewModel.collapseAllExceptSelectedOne() }
                            }
                    }
                    .contentShape(Rectangle())
                    .font(.title3)
                    .onTapGesture {
                        sectionHeader.expanded.toggle()
                        viewModel.setSelectedIntervalSectionHeader(selectedSection: sectionHeader)
                        withAnimation { viewModel.collapseAllExceptSelectedOne() }
                    }
                }.buttonStyle(PlainButtonStyle()).accentColor(.clear).disabled(false)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        ReminderSettingsListView()
    }
}
