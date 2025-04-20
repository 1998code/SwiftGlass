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
            .background(
                Color.accentColor
                    .opacity(focus ? 0.3 : 0.05)
            )
            .glass(
                color: focus ? .accentColor : .white,
                shadowColor: focus ? .accentColor : .white
            )
            .padding(50)

            .animation(.default)
    }
}

#Preview("Light") {
    Input()
}

#Preview("Dark") {
    Input()
        .preferredColorScheme(.dark)
}
