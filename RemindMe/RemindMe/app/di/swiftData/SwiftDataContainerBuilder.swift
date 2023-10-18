//
//  ContainerBuilder.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import Swinject

@available(iOS 17, *)
@MainActor
final class SwiftDataContainerBuilder {
    static let shared = SwiftDataContainerBuilder()

    
    private var modelContainer: ModelContainer

    private init() {
        modelContainer = try! ModelContainer(for: LecturePersistentModel.self, StudentPersistentModel.self, SchoolPersistentModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
    }

    private lazy var context: ModelContext = {
        return modelContainer.mainContext
    }()

    func buildContainer() -> Container {
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
}
