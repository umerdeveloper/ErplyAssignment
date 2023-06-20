//
//  RangeReplaceableCollection+Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 18.02.2023.
//

import Foundation

extension RangeReplaceableCollection where Element: Equatable {
    @discardableResult
    mutating func appendIfNotContains(_ element: Element) -> (appended: Bool, memberAfterAppend: Element) {
        if !contains(element) {
            append(element)
            return (true, element)
        }
        return (false, element)
    }
}
