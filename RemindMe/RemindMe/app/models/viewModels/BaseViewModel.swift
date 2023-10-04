//
//  BaseViewModel.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData

@MainActor
public class BaseViewModel<T> where T: PersistentProtocol {
    typealias PersistentType = T.Type

    private func getContext() -> ModelContext? {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true, allowsSave: false)
            let container = try ModelContainer(
                for: T.self,
                configurations: configuration
            )
            return container.mainContext
        } catch {
            return nil
        }
    }

    func savePersistable(model: T) throws {
        getContext()?.insert(model)
        try getContext()?.save()
    }
}
