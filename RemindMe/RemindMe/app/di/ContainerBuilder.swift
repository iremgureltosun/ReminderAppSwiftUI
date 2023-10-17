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

    func buildContainerForSwiftData() -> Container {
        let container = Container()

        container.register(LectureManagerProtocol.self) { _ in
            LecturePersistenceManager()
        }.inObjectScope(.container)

        container.register(StudentManagerProtocol.self) { _ in
            StudentPersistenceManager()
        }.inObjectScope(.container)

        container.register(SchoolManagerProtocol.self) { _ in
            SchoolPersistenceManager()
        }.inObjectScope(.container)

        return container
    }

    func buildContainerForRealm() -> Container {
        let container = Container()

        container.register(LectureManagerProtocol.self) { _ in
            LectureRealmManager()
        }.inObjectScope(.container)

        container.register(StudentManagerProtocol.self) { _ in
            StudentRealmManager()
        }.inObjectScope(.container)

        container.register(SchoolManagerProtocol.self) { _ in
            SchoolRealmManager()
        }.inObjectScope(.container)

        return container
    }
}
