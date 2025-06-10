//
//  GlassBackgroundModifier.swift
//  SwiftGlass
//
//  Created by Ming on 21/4/2025.
//

import SwiftUI

@available(iOS 15.0, macOS 14.0, watchOS 10.0, tvOS 15.0, visionOS 1.0, *)
public struct GlassBackgroundModifier: ViewModifier {
    /// Controls when the glass effect should be displayed
    public enum GlassBackgroundDisplayMode {
        case always    // Always show the effect
        case automatic // System determines visibility based on context
    }
    
    /// Determines the gradient direction used in the glass effect's border
    public enum GradientStyle {
        case normal    // Light at top-left and bottom-right
        case reverted  // Light at top-right and bottom-left
    }
    
    // Configuration properties for the glass effect
    let displayMode: GlassBackgroundDisplayMode
    let radius: CGFloat
    let color: Color
    let material: Material
    let gradientOpacity: Double
    let gradientStyle: GradientStyle
    let strokeWidth: CGFloat
    let shadowColor: Color
    let shadowOpacity: Double
    let shadowRadius: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    
    /// Creates a new glass effect modifier with the specified appearance settings
    public init(
        displayMode: GlassBackgroundDisplayMode,
        radius: CGFloat,
        color: Color,
        material: Material = .ultraThinMaterial,
        gradientOpacity: Double = 0.5,
        gradientStyle: GradientStyle = .normal,
        strokeWidth: CGFloat = 1.5,
        shadowColor: Color = .white,
        shadowOpacity: Double = 0.5,
        shadowRadius: CGFloat? = nil,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 5
    ) {
        self.displayMode = displayMode
        self.radius = radius
        self.color = color
        self.material = material
        self.gradientOpacity = gradientOpacity
        self.gradientStyle = gradientStyle
        self.strokeWidth = strokeWidth
        self.shadowColor = shadowColor
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius ?? radius
        self.shadowX = shadowX
        self.shadowY = shadowY
    }
    
    /// Applies the glass effect to the content view
    /// Implementation uses three primary techniques:
    /// 1. Material background for the frosted effect
    /// 2. Gradient stroke for edge highlighting
    /// 3. Shadow for depth perception
    public func body(content: Content) -> some View {
        if #available(iOS 26.0, macOS 26.0, watchOS 26.0, tvOS 26.0, visionOS 26.0, *) {
            content
                .background(material)
                .glassEffect(in: .rect(cornerRadius: radius))
                .cornerRadius(radius)
                .shadow(color: shadowColor.opacity(shadowOpacity), radius: shadowRadius, x: shadowX, y: shadowY)
        } else {
            content
                .background(material) // Use the specified material for the frosted glass base
                .cornerRadius(radius) // Rounds the corners
                .overlay(
                    // Adds subtle gradient border for dimensional effect
                    RoundedRectangle(cornerRadius: radius)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: gradientColors()),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: strokeWidth
                        )
                )
                // Adds shadow for depth and elevation
                .shadow(color: shadowColor.opacity(shadowOpacity), radius: shadowRadius, x: shadowX, y: shadowY)
        }
    }
    
    /// Generates the gradient colors based on the selected style
    /// Creates the illusion of light reflection on glass edges
    private func gradientColors() -> [Color] {
        switch gradientStyle {
        case .normal:
            return [
                color.opacity(gradientOpacity),
                .clear,
                .clear,
                color.opacity(gradientOpacity)
            ]
        case .reverted:
            return [
                .clear,
                color.opacity(gradientOpacity),
                color.opacity(gradientOpacity),
                .clear
            ]
        }
    }
}
