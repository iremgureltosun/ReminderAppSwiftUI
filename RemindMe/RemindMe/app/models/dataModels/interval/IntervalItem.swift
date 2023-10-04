//
//  IntervalOptionModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 3.10.2023.
//

import SwiftUI

final class IntervalItem: ObservableObject, Identifiable {
    var id: Int
    var sectionHeader: any IntervalProtocol
    @Published var checked: Bool = false

    init(id: Int, sectionHeader: any IntervalProtocol) {
        self.id = id
        self.sectionHeader = sectionHeader
    }
}
