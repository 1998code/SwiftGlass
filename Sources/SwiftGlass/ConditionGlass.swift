//
//  ConditionGlass.swift
//  SwiftGlass
//
//  Created by Ming on 10/6/2025.
//

import SwiftUI

// MARK: - View Extensions

extension View {
    @ViewBuilder
    public func conditionalGlass() -> some View {
        if #available(iOS 26.0, macOS 26.0, watchOS 26.0, tvOS 26.0, visionOS 26.0, *) {
            self
        } else {
            // Apply glass effect from SwiftGlass library to create translucent look
            self.glass()
        }
    }
}
