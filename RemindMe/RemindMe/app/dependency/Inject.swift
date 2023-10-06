//
//  Inject.swift
//  RemindMe
//
//  Created by Tosun, Irem on 5.10.2023.
//

import Foundation
import Swinject
import SwiftData

@propertyWrapper
@MainActor
struct Inject<Component> {
    let wrappedValue: Component
    init(context: ModelContext) {
        wrappedValue = Resolver.shared.resolve(Component.self)
    }
}
