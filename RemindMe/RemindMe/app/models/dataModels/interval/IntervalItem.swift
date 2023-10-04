//
//  IntervalOptionModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

final class IntervalItem: ObservableObject, Identifiable {
    var id: UUID = UUID()
    var sectionHeader: any IntervalProtocol
    @Published var checked: Bool = false
    
    init(sectionHeader: any IntervalProtocol) {
        self.sectionHeader = sectionHeader
    }
}
