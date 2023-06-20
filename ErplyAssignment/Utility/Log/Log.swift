//
//  Log.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 20.06.2023.
//

import Foundation

enum Log {
    enum LogLevel {
        case info
        case warning
        case error

        fileprivate var prefix: String {
            switch self {
            case .info: return "💁🏻 Info"
            case .warning: return "⚠️ Warning"
            case .error: return "❌ Error"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        var description: String {
            "\((file as NSString).lastPathComponent) : \(line) \(function)"
        }
    }

    static func info(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str, shouldLogContext: shouldLogContext, context: context)
    }

    static func warning(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .warning, str: str, shouldLogContext: shouldLogContext, context: context)
    }

    static func error(_ str: String, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error, str: str, shouldLogContext: shouldLogContext, context: context)
    }

    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logComponents = ["[\(level.prefix)]", str]

        var fullString = logComponents.joined(separator: " ")
        if shouldLogContext {
            fullString += "-> \(context.description)"
        }

        #if DEBUG
        print(fullString)
        #endif
    }
}
