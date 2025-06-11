//
//  SwiftGlass.swift
//  SwiftGlass
//
//  Created by Ming on 20/4/2025.
//
//  CONTRIBUTING:
//  -------------
//  - To report bugs or request features, please open an issue on GitHub
//  - When submitting a pull request, please follow the coding style of the project
//
//  CODE OVERVIEW:
//  -------------
//  SwiftGlass provides a consistent glass/frosted effect across Apple platforms.
//  The implementation consists of:
//  1. A View extension that applies the glass effect with customizable parameters
//  2. A ViewModifier that handles the actual rendering using materials, gradients, and shadows
//  3. Platform-specific handling (native API for visionOS, custom implementation elsewhere)
//

import SwiftUI

@available(iOS 15.0, macOS 14.0, watchOS 10.0, tvOS 15.0, visionOS 1.0, *)
public extension View {
    /// Applies a customizable glass/frosted effect to the view
    /// - Parameters:
    ///   - displayMode: Controls when the effect is displayed (.always or .automatic)
    ///   - radius: Corner radius of the glass effect
    ///   - color: Base color for the effect's gradient and highlights
    ///   - material: The material style to use for the glass effect
    ///   - gradientOpacity: Opacity level for the gradient overlay
    ///   - gradientStyle: Direction style of the gradient (.normal or .reverted)
    ///   - strokeWidth: Width of the border stroke
    ///   - shadowColor: Color of the drop shadow
    ///   - shadowOpacity: Opacity level for the shadow
    ///   - shadowRadius: Blur radius for the shadow (defaults to corner radius if nil)
    ///   - shadowX: Horizontal offset of the shadow
    ///   - shadowY: Vertical offset of the shadow
    /// - Returns: A view with the glass effect applied
    func glass(
        displayMode: GlassBackgroundModifier.GlassBackgroundDisplayMode = .always,
        radius: CGFloat = 32,
        color: Color = .white,
        colorOpacity: Double = 0.1,
        material: Material = .ultraThinMaterial,
        gradientOpacity: Double = 0.5,
        gradientStyle: GlassBackgroundModifier.GradientStyle = .normal,
        strokeWidth: CGFloat = 1.5,
        shadowColor: Color = {
            #if os(iOS) || os(tvOS)
            return Color(UIColor.systemBackground)
            #elseif os(watchOS)
            return Color(UIColor.black)
            #elseif os(macOS)
            return Color(NSColor.controlBackgroundColor)
            #else
            return Color.primary
            #endif
        }(),
        shadowOpacity: Double = 0.5,
        shadowRadius: CGFloat? = nil,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 5,
        isInToolbar: Bool = false
    ) -> some View {
        #if os(visionOS)
        // Use the native glass effect on visionOS for optimal rendering and system integration
        return self.glassBackgroundEffect()
        #else
        // Custom implementation on other platforms combines materials, gradients and shadows
        return modifier(GlassBackgroundModifier(
            displayMode: displayMode,
            radius: radius,
            color: color,
            colorOpacity: colorOpacity,
            material: material,
            gradientOpacity: gradientOpacity,
            gradientStyle: gradientStyle,
            strokeWidth: strokeWidth,
            shadowColor: shadowColor,
            shadowOpacity: shadowOpacity,
            shadowRadius: shadowRadius,
            shadowX: shadowX,
            shadowY: shadowY,
            isInToolbar: isInToolbar
        ))
        #endif
    }
    
    /// Applies a liquefied glass effect with animation to the view
    /// - Parameters:
    ///   - color: Base color for the jelly effect
    ///   - blobIntensity: Controls how pronounced the blob deformation is (0.0-1.0)
    ///   - animationSpeed: Controls the speed of the animation (1.0 is default)
    ///   - complexity: Number of control points that define the blob shape (4-12 recommended)
    ///   - material: The material style to use for the glass effect
    ///   - gradientOpacity: Opacity level for the gradient overlay
    ///   - shadowOpacity: Opacity level for the shadow
    /// - Returns: A view with animated jelly glass effect applied
    func liquefiedGlass(
        color: Color = .blue,
        blobIntensity: CGFloat = 0.5,
        animationSpeed: Double = 1.0,
        complexity: Int = 8,
        material: Material = .ultraThinMaterial,
        gradientOpacity: Double = 0.5,
        shadowOpacity: Double = 0.3
    ) -> some View {
        let modifier = BlobGlassModifier(
            color: color,
            blobIntensity: blobIntensity,
            animationSpeed: animationSpeed,
            complexity: complexity,
            material: material,
            gradientOpacity: gradientOpacity,
            shadowOpacity: shadowOpacity
        )
        
        return self.modifier(modifier)
    }
}
