//
//  DataEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

public protocol StorageProtocol {
    associatedtype EntityType

    init(_ entity: EntityType)

    func getModel() -> EntityType
}
