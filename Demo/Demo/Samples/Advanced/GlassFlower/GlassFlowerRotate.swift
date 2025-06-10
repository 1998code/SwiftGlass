//
//  GlassFlowerRotate.swift
//  Demo
//
//  Created by Ming on 20/4/2025.
//
//  A decorative flower-like component that demonstrates the glass effect
//  with animated petals arranged in a circular pattern.

import SwiftUI
import SwiftGlass

struct GlassFlowerRotate: View {
    // Rainbow color palette for the petals, each petal will use one color from this array
    // Colors are ordered to create a pleasing visual transition when arranged in a circle
    let colors: [Color] = [
        .orange,
        .yellow,
        Color(red: 0.7, green: 1.0, blue: 0.3), // lime green
        .green,
        .blue,
        .purple,
        .red,
        Color(red: 1.0, green: 0.5, blue: 0.5) // coral/light-red
    ]
    
    // Controls the animation state between expanded and contracted form
    @State private var isPulsing = false
    // Controls whether petals are rotated toward center
    @State private var rotateToCenter = false
    
    var body: some View {
        ZStack {
            // Flower petals: Eight capsules arranged in a circle pattern
            // Each petal is a gradient-filled capsule with glass effect applied
            ForEach(0..<8, id: \.self) { index in
                Capsule()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: colors[index % colors.count], location: 0),
                                .init(color: colors[index % colors.count].opacity(0.5), location: 1)
                            ]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                
                    // Apply glass effect from SwiftGlass library to create translucent look
                    .glass(color: colors[index % colors.count])
                
                    .frame(width: 55, height: 100) // Petal dimensions
                    .offset(x: 0, y: 0) // Position petals away from center
                    .rotationEffect(.degrees(Double(index) * 45), anchor: .bottom) // Distribute evenly in 360° (8×45°)
                    .rotationEffect(rotateToCenter ? .degrees(720) : .degrees(0), anchor: .bottom) // Rotate petals to face center when activated
                    .offset(y: -50) // Adjust vertical position of entire flower
                    .scaleEffect(isPulsing ? 0.97 : 1.05) // Size animation range
                    .animation(
                        Animation.easeInOut(duration: 2.0)
                            .delay(Double(index) * 0.1) // Staggered animation for flowing effect
                            .repeatForever(autoreverses: true),
                        value: isPulsing
                    )
                    .animation(
                        Animation.easeInOut(duration: 3.5)
                            .delay(Double(index) * 0.15), // Slightly staggered rotation
                        value: rotateToCenter
                    )
            }
            
            // Button to toggle rotation to center
            Button(action: {
                withAnimation {
                    rotateToCenter.toggle()
                }
            }) {
                Text(rotateToCenter ? "Reset Rotation" : "Rotate to Center")
                    .foregroundColor(.white)
                    .padding(15)
            }
            .cornerRadius(8)
            
            .glass(color: .blue, shadowColor: .blue)
            
            .offset(y: 240) // Position button below the flower
        }
        .frame(width: 300, height: 300)
        // Start the pulsing animation when view appears
        .onAppear {
            isPulsing.toggle()
        }
    }
}

// MARK: - Previews

#Preview("Dark") {
    GlassFlowerRotate()
        .preferredColorScheme(.dark)
}
