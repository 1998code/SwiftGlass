//
//  List.swift
//  Demo
//
//  Created by Ming on 22/4/2025.
//

import SwiftUI
import SwiftGlass

struct DefaultList: View {
    var body: some View {
        List {
            ForEach(colorOptions, id: \.name) { option in
                Text("\(option.name.capitalized)")
                    .bold()
                    .foregroundStyle(option.color)
                    .listRowBackground(
                        option.color.opacity(0.1)
                            .glass(color: option.color, shadowColor: option.color)
                            .padding(1)
                    )
            }
        }
#if !os(watchOS)
        .listRowSpacing(12)
#endif
    }
}

struct DefaultListAnimate: View {
    @State private var visibleItems = Set<String>()
    
    var body: some View {
        List {
            ForEach(Array(zip(colorOptions.indices, colorOptions)), id: \.1.name) { index, option in
                Text("\(option.name.capitalized)")
                    .bold()
                    .foregroundStyle(option.color)
                    .listRowBackground(
                        option.color.opacity(0.1)
                            .glass(color: option.color, shadowColor: option.color)
                            .padding(1)
                    )
                    .opacity(visibleItems.contains(option.name) ? 1 : 0)
                    .offset(y: visibleItems.contains(option.name) ? 0 : 20)
                    .animation(.easeInOut.delay(Double(index) * 0.3), value: visibleItems.contains(option.name))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            visibleItems.insert(option.name)
                        }
                    }
            }
        }
#if !os(watchOS)
        .listRowSpacing(12)
#endif
    }
}

struct InsetList: View {
    var body: some View {
        List {
            ForEach(colorOptions, id: \.name) { option in
                Text("\(option.name.capitalized)")
                    .bold()
                    .foregroundStyle(option.color)
                    .listRowBackground(
                        option.color.opacity(0.1)
                            .glass(color: option.color, shadowColor: option.color, shadowRadius: 1)
                            .padding(2)
                    )
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.inset)
        #if !os(watchOS)
        .listRowSpacing(20)
        #endif
        .padding(5)
    }
}

struct InsetListAnimate: View {
    @State private var visibleItems = Set<String>()
    
    var body: some View {
        List {
            ForEach(Array(zip(colorOptions.indices, colorOptions)), id: \.1.name) { index, option in
                Text("\(option.name.capitalized)")
                    .bold()
                    .foregroundStyle(option.color)
                    .listRowBackground(
                        option.color.opacity(0.1)
                            .glass(color: option.color, shadowColor: option.color, shadowRadius: 1)
                            .padding(2)
                    )
#if !os(watchOS)
                    .listRowSeparator(.hidden)
#endif
                    .opacity(visibleItems.contains(option.name) ? 1 : 0)
                    .offset(y: visibleItems.contains(option.name) ? 0 : 20)
                    .animation(.easeInOut.delay(Double(index) * 0.3), value: visibleItems.contains(option.name))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            visibleItems.insert(option.name)
                        }
                    }
            }
        }
#if !os(watchOS)
        .listStyle(.inset)
        .listRowSpacing(20)
#endif
        .padding(5)
    }
}

#Preview("Inset List (3D) Animation") {
    InsetListAnimate()
        .preferredColorScheme(.dark)
}

#Preview("Inset List (3D)") {
    InsetList()
        .preferredColorScheme(.dark)
}

#Preview("Default List Animation") {
    DefaultListAnimate()
        .preferredColorScheme(.dark)
}

#Preview("Default List") {
    DefaultList()
        .preferredColorScheme(.dark)
}
