//
//  ErplyAssignmentApp.swift
//  ErplyAssignment
//
//  Created by Umer Khan on 19.06.2023.
//

import SwiftUI

@main
struct ErplyAssignmentApp: App {

    @StateObject private var appFlowManager = AppFlowManager()

    var body: some Scene {
        WindowGroup {
            AppFlowScreen()
                .environmentObject(appFlowManager)
        }
    }
}
