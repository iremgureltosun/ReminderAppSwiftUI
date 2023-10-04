//
//  PillShapedButton.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import SwiftUI

struct PillShapedButton: View {
    let text: String
    let buttonPressed: () -> Void
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .frame(height: 50)
            .foregroundColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
            .overlay {
                Text(text)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .onTapGesture {
                buttonPressed()
            }
    }
}

#Preview {
    PillShapedButton(text: "Save", buttonPressed: {})
}
