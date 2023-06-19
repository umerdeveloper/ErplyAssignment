//
//  UserDefaultsStorage.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import Foundation

protocol PermanentStorageKey {
    var value: String { get }
}

protocol PermanentStorage {
    func set<T: Encodable>(data: T?, key: PermanentStorageKey)
    func get<T: Decodable>(key: PermanentStorageKey, decode: T.Type) -> T?
    func remove(key: PermanentStorageKey)
}

protocol UserDefaultStorage: PermanentStorage {}

enum UserDefaultsStorageKey: String, PermanentStorageKey {
    case login

    var value: String {
        rawValue
    }
}

final class DefaultUserDefaultStorage: UserDefaultStorage {

    private let defaults = UserDefaults.standard
    
    func set<T: Encodable>(data: T?, key: PermanentStorageKey) {
        do {
            try defaults.set(JSONEncoder().encode(data), forKey: key.value)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func get<T: Decodable>(key: PermanentStorageKey, decode: T.Type) -> T? {
        do {
            if let data = defaults.data(forKey: key.value) {
                return try JSONDecoder().decode(T.self, from: data)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
        
        return nil
    }
    
    func remove(key: PermanentStorageKey) {
        defaults.removeObject(forKey: key.value)
    }
}
