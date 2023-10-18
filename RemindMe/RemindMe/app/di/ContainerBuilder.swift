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

    var context: ModelContext

    private init() {
        let modelContainer = try! ModelContainer(for: LecturePersistentModel.self, StudentPersistentModel.self, SchoolPersistentModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        context = modelContainer.mainContext
    }

    func buildContainerForSwiftData() -> Container {
        let container = Container()

        container.register(LectureStorageProtocol.self) { _ in
            LecturePersistenceManager(context: self.context)
        }.inObjectScope(.container)

        container.register(StudentStorageProtocol.self) { _ in
            StudentPersistenceManager(context: self.context)
        }.inObjectScope(.container)

        container.register(SchoolStorageProtocol.self) { _ in
            SchoolPersistenceManager(context: self.context)
        }.inObjectScope(.container)

        return container
    }

    func buildContainerForRealm() -> Container {
        let container = Container()

        container.register(LectureStorageProtocol.self) { _ in
            LectureRealmManager()
        }.inObjectScope(.container)

        container.register(StudentStorageProtocol.self) { _ in
            StudentRealmManager()
        }.inObjectScope(.container)

        container.register(SchoolStorageProtocol.self) { _ in
            SchoolRealmManager()
        }.inObjectScope(.container)

        return container
    }
}
