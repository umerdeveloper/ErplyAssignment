//
//  String+Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 17.02.2023.
//

import Foundation

extension String {
    var asDate: Date? {
        if let date = try? Date(self, strategy: Date.ISO8601FormatStyle()) {
            return date
        }
        return nil
    }
}

extension String {
    func trimmed() -> Self {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    func empty() -> Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
