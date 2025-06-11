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
                                    .padding(.trailing, 5)
                            }
                            .padding(.vertical, 2)
                            .accentColor(.primary)
                        }
                        .glass(color: .primary, shadowColor: .primary, isInToolbar: true)
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                            .bold()
                            .padding(.vertical, 3)
                            .padding(.leading, 5)
                            .padding(.trailing, 11.5)
                            .glass(color: .blue, shadowColor: .blue, isInToolbar: true)
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
        }.glass(color: .red.opacity(0.1), shadowColor: .red)
    }
}

#Preview("Dark") {
    Buttons()
        .preferredColorScheme(.dark)
}
