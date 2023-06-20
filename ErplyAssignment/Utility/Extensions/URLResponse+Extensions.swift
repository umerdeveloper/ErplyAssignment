//
//  URLResponse+Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 17.02.2023.
//

import Foundation

extension URLResponse {
    func isResponseValid(_ code: Int) -> Bool {
        StatusCode.validResponseRange ~= code
    }

    func isClientError(_ code: Int) -> Bool {
        StatusCode.clientErrorRange ~= code
    }

    func isServerError(_ code: Int) -> Bool {
        StatusCode.serverErrorRange ~= code
    }
}
