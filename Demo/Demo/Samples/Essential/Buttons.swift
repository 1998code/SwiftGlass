//
//  Buttons.swift
//  Demo
//
//  Created by Ming on 22/4/2025.
//

import SwiftUI
import SwiftGlass

struct Buttons: View {
    var body: some View {
        NavigationStack {
            deleteButton
            
#if !os(watchOS)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {}) {
                            HStack(spacing: 3) {
                                Image(systemName: "chevron.left")
                                    .font(.caption)
                                    .padding(.leading, 6)
                                Text("Back")
                                    .bold()
                                    .padding(.trailing, 1.5)
                            }
                            .padding(.vertical, 2)
                            .accentColor(.primary)
                        }.background(.primary.opacity(0.1))
                        .glass(color: .primary, shadowColor: .primary.opacity(0.75))
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                            .bold()
                            .padding(.vertical, 3)
                            .padding(.leading, 5)
                            .padding(.trailing, 11.5)
                            .background(Color.accentColor.opacity(0.1))
                            .glass(color: .accentColor, shadowColor: .accentColor)
                    }
                }
#endif
        }
    }
    
    var deleteButton: some View {
        Button(action: {}) {
            Text("Hold to Delete!")
                .bold()
                .padding(25)
                .foregroundStyle(.red)
        }.background(.red.opacity(0.1))
        .glass(color: .red, shadowColor: .red)
    }
}

#Preview("Dark") {
    Buttons()
        .preferredColorScheme(.dark)
}
