//
//  Basic.swift
//  Demo
//
//  Created by Ming on 20/4/2025.
//

import SwiftUI
import SwiftGlass

struct Basic: View {
    var body: some View {
        ZStack {
            
#if !os(visionOS) && !os(watchOS) && !os(macOS)
            background
#endif

            container
#if !os(watchOS)
                .padding(25)
#else
                .padding(15)
#endif
                .glass()
            
#if os(tvOS)
                .frame(maxWidth: 500)
#elseif !os(watchOS)
                .frame(maxWidth: 300)
#else
                .frame(maxWidth: 175)
#endif
            
        }
    }
    
    // Sample Card Content
    var container: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Welcome Back")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text("HOME")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                }
                
#if !os(watchOS)
                Spacer()
                
                Image(systemName: "homekit")
                    .font(.largeTitle)
                    .symbolRenderingMode(.multicolor)
#endif
            }
            
            Button(action: {
                print("Welcome to Swift Glass Demo!")
            }) {
                HStack {
                    Spacer()
#if !os(watchOS)
                    Label("Open Garage", systemImage:"door.garage.closed.trianglebadge.exclamationmark")
                        .font(.body.bold())
                        .symbolRenderingMode(.multicolor)
                        .font(.caption)
#else
                    Label("Open", systemImage:"door.garage.closed")
                        .bold()
                        .symbolRenderingMode(.multicolor)
                        .font(.caption)
#endif
                    Spacer()
                }
#if os(macOS)
                .padding(.vertical, 10)
#endif
            }
            .buttonStyle(.borderedProminent)
#if !os(tvhOS)
            .buttonBorderShape(.capsule)
#endif
            .tint(.orange)
            .glass(color: .yellow)
        }
    }
    
    // Add a background for better looking
    var background: some View {
        Group {
            Color.black
                .ignoresSafeArea()
            
            AsyncImage(url: URL(string: "https://shareby.vercel.app/3vj7gk")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }.opacity(0.3)
            .ignoresSafeArea()
        }
    }
}

#Preview("Light") {
    Basic()
}

#Preview("Dark") {
    Basic()
        .preferredColorScheme(.dark)
}
