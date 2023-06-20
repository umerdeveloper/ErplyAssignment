//
//  JSONDecoder+Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 17.02.2023.
//

import Foundation

extension JSONDecoder {

    /// Help to give more generic error type and Log error for debugging
    func doDecoding<T: Codable>(_ obj: T.Type, from data: Data) -> Result<T, DecodingErrorType> {

        do {
            let decodedData = try self.decode(T.self, from: data)
            return .success(decodedData)

        } catch let DecodingError.dataCorrupted(context) {
            Log.error(context.debugDescription)
            return .failure(.dataCorrupted)

        } catch let DecodingError.keyNotFound(key, context) {
            Log.error("Key '\(key)' not found: \(context.debugDescription)")
            Log.error("CodingPath: \(context.codingPath)")
            return .failure(.keyNotFound)

        } catch let DecodingError.valueNotFound(value, context) {
            Log.error("Value '\(value)' not found: \(context.debugDescription)")
            Log.error("CodingPath: \(context.codingPath)")
            return .failure(.valueNotFound)

        } catch let DecodingError.typeMismatch(type, context) {
            Log.error("Type '\(type)' mismatch: \(context.debugDescription)")
            Log.error("CodingPath: \(context.codingPath)")
            return .failure(.typeMismatch)

        } catch {
            Log.error("Unknown error: \(error)")
            return .failure(.unknown)
        }
    }
}
