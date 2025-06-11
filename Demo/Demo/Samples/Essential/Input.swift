//
//  Input.swift
//  Demo
//
//  Created by Ming on 21/4/2025.
//

import SwiftUI
import SwiftGlass

struct Input: View {
    @State var content: String = ""
    @FocusState var focus: Bool
    
    var body: some View {
        
        TextField("Placeholder...", text: $content)
            .focused($focus)
            .font(.largeTitle)
            .textFieldStyle(.plain)
            .padding(25)
            .glass(
                color: focus ? .accentColor : .white,
                shadowColor: focus ? .accentColor : .primary
            )
            .padding(50)

            .animation(.default)
    }
}

@available(iOS 17.0, *)
#Preview("Light", traits: .landscapeLeft) {
    Input()
}

@available(iOS 17.0, *)
#Preview("Dark", traits: .landscapeLeft) {
    Input()
        .preferredColorScheme(.dark)
}
