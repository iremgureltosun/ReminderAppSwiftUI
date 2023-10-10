//
//  DataEntity.swift
//  RemindMe
//
//  Created by Tosun, Irem on 10.10.2023.
//

import Foundation

public protocol CommonDataProtocol {
    associatedtype EntityType

    init(_ entity: EntityType)

    func getDataModel() -> EntityType
}
