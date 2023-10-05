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

        container.register(ReminderPersistenceManagerProtocol.self) { _ in
            ReminderPersistenceManager(context: context)
        }.inObjectScope(.container)

        return container
    }
    
    func buildContainer() -> Container {
        let container = Container()
        return container
    }
}
