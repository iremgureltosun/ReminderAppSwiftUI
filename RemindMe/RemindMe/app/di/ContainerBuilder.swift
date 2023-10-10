//
//  ContainerBuilder.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import Swinject

@MainActor
final class ContainerBuilder {
    static let shared = ContainerBuilder()

    func buildContainer(context: ModelContext) -> Container {
        let container = Container()

        container.register(ReminderPersistenceManagerProtocol.self) { resolver in
            ReminderPersistenceManager(context: context)
        }.inObjectScope(.container)

        container.register(StudentPersistenceManagerProtocol.self) { _ in
            StudentPersistenceManager(context: context)
        }.inObjectScope(.container)

        container.register(SchoolPersistenceManagerProtocol.self) { _ in
            SchoolPersistenceManager(context: context)
        }.inObjectScope(.container)

        return container
    }
}
