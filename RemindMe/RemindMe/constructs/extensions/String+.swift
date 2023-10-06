//
//  String+.swift
//  RemindMe
//
//  Created by Tosun, Irem on 6.10.2023.
//

import Foundation
extension String {
    var isEmptyOrWhiteSpace: Bool {
        trimmingCharacters(in: .whitespaces).isEmpty
    }
}
