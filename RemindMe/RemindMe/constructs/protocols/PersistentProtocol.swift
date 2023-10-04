//
//  PersistentProtocol.swift
//  RemindMe
//
//  Created by Tosun, Irem on 4.10.2023.
//

import Foundation
import SwiftData
import SwiftUI

public protocol PersistentProtocol: PersistentModel, Observable{
    associatedtype PersistentType
}
