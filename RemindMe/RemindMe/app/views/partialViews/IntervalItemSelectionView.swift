//
//  Checkbox.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

struct IntervalItemSelectionView: View {
    @ObservedObject var item: IntervalItem

    var body: some View {
        HStack {
            Text(item.sectionHeader.title)
            Spacer()
            Button {
                item.checked.toggle()

            } label: {
                Image(systemName: item.checked == true ? "checkmark.square.fill" : "checkmark.square")
                    .opacity(item.checked == true ? 1 : 0.4)
                    .foregroundColor(.green)
            }
        }
    }
}

// #Preview {
// Checkbox()
// }
