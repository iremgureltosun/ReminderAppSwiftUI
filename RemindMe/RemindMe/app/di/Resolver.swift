//
//  Resolver.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import Swinject

@MainActor
final class Resolver {
    private var container: Container
    static let shared = Resolver()

    private init() {
        container = ContainerBuilder.shared.buildContainerForSwiftData()
    }

    func resolve<T>(_: T.Type) -> T {
        container.resolve(T.self)!
    }
}
