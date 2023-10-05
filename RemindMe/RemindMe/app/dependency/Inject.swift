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
        let resolver: Resolver = .init(withValue: context)
        wrappedValue = resolver.resolve(Component.self)
    }
}
