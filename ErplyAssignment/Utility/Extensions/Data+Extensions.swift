//
//  Data+Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 17.02.2023.
//

import Foundation

extension Data {
    /// NSString gives us a nice sanitised
    var prettyJSONString: NSString? {

        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString
    }
}
