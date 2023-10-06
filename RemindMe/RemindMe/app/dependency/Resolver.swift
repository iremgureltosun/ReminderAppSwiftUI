//
//  Resolver.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import Swinject

@MainActor
final class Resolver {
    var context: ModelContext

    private var container: Container

    static let shared = Resolver()

    private init() {
        container = ContainerBuilder.shared.buildContainer()
        let modelContainer = try! ModelContainer(for: StudentModel.self)
        context = modelContainer.mainContext
    }

    convenience init(withValue context: ModelContext) {
        self.init()
        self.context = context
        container = ContainerBuilder.shared.buildContainer(context: context)
    }

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
