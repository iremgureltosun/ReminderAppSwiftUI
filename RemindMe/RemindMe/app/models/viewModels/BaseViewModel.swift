//
//  BaseViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
class BasePersistentViewModel: ObservableObject {
    var modelContext: ModelContext
    @Published var showSuccess = false
    @Published var showAlert = false
    @Published var errorMessage = "An undefined error occurred."
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
}
