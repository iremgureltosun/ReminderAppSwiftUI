//
//  TimePicker2.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import SwiftUI

struct TimerView: View {
    @State private var hours = Calendar.current.component(.hour, from: Date())
    @State private var minutes = Calendar.current.component(.minute, from: Date())

    var body: some View {
        TimeEditPicker(selectedHour: $hours, selectedMinute: $minutes)
    }

    private struct TimeEditPicker: View {
        @Binding var selectedHour: Int
        @Binding var selectedMinute: Int

        enum Constants{
            static let height: CGFloat = 100
            static let bgColor: Color = .clear
        }
        var body: some View {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Spacer()
                    Picker("", selection: self.$selectedHour) {
                        ForEach(0 ..< 24) {
                            Text(String($0)).tag($0)
                        }
                    }
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(width: geometry.size.width / 5, height: Constants.height)
                    .clipped()

                    Picker("", selection: self.$selectedMinute) {
                        ForEach(0 ..< 60) {
                            Text(String($0)).tag($0)
                        }
                    }
                    .labelsHidden()
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(width: geometry.size.width / 5, height: Constants.height)
                    .clipped()

                    Spacer()
                }
                .background(Constants.bgColor)
            }
            .frame(height: Constants.height)
            .mask(Rectangle())
        }
    }
}

#Preview {
    TimerView()
}
