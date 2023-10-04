//
//  Checkbox.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

struct Checkbox: View {
    @State var selected: Bool
    var selectionHandler: () -> Void
    
    var body: some View {
        Button {
            selected.toggle()
            selectionHandler()
        } label: {
            Image(systemName: selected == true ? "checkmark.square.fill": "checkmark.square")
                .foregroundColor(.green)
        }
    }
}

//#Preview {
    //Checkbox()
//}
