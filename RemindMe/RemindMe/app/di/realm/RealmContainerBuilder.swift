//
//  RealmContainerBuilder.swift
//  RemindMe
//
//  Created by Tosun, Irem on 18.10.2023.
//

import Foundation
import Swinject

@MainActor
final class RealmContainerBuilder {
    static let shared = RealmContainerBuilder()

    func buildContainer() -> Container {
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
