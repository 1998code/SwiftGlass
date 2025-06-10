//
//  _BlankTemplate.swift
//  Demo
//
//  Created by Ming on 20/4/2025.
//

import SwiftUI
import SwiftGlass

struct BlankTemplate: View {
    var body: some View {
        ZStack {
            bg
            Text("Hello, Developer!")
                .bold()
                .padding(25)
                .glass()
        }
    }
    
    var bg: some View {
        LinearGradient(colors: [Color.clear, Color.pink.opacity(0.85)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview("Dark") {
    BlankTemplate()
        .preferredColorScheme(.dark)
}
