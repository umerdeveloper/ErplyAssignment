//
//  View + Extensions.swift
//  PlandayAssignment
//
//  Created by Umer Khan on 17.02.2023.
//

import SwiftUI

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
