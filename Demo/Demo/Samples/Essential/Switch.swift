//
//  Switch.swift
//  Demo
//
//  Created by Ming on 12/6/2025.
//

import SwiftUI
import SwiftGlass

struct Toggle: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack {
            bg
            HStack {
                VStack(spacing: 20) {
                    Switch("", isOn: $isOn)
                        .accentColor(.green)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.clear)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.black)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.blue)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.brown)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.cyan)
                    
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    Switch("", isOn: $isOn)
                        .accentColor(.indigo)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.mint)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.orange)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.pink)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.purple)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.red)
                    
                    Spacer()
                }
                
                VStack(spacing: 20) {
                    Switch("", isOn: $isOn)
                        .accentColor(.teal)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.white)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.yellow)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.accentColor)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.primary)
                    
                    Switch("", isOn: $isOn)
                        .accentColor(.secondary)
                    
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
    
    var bg: some View {
        LinearGradient(colors: [Color.clear, Color.blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct Switch: View {
    let title: String
    @Binding var isOn: Bool
    
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var dragDirection: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    
    private let toggleWidth: CGFloat = 60
    private let thumbSize: CGFloat = 26
    private let maxOffset: CGFloat = 15
    
    init(_ title: String, isOn: Binding<Bool>) {
        self.title = title
        self._isOn = isOn
    }
    
    private var fillProgress: CGFloat {
        if isDragging {
            let progress = (dragOffset + maxOffset) / (maxOffset * 2)
            return max(0, min(1, progress))
        } else {
            return isOn ? 1.0 : 0.0
        }
    }
    
    var body: some View {
        HStack {
            ZStack {
                // Base track (gray background)
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(
                        colors: isOn ? [.accentColor.opacity(0.3), .accentColor.opacity(1.0)] : [.gray.opacity(0.3), .clear],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .frame(width: toggleWidth, height: 30)
                    .glass()
                
                if isDragging {
                    // Progressive fill container with proper right-to-left gray unfill
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.clear)
                        .frame(width: toggleWidth, height: 30)
                        .overlay(
                            ZStack {
                                // Base fill (toggleColor or gray depending on direction)
                                if dragDirection >= 0 && !isOn {
                                    // Dragging right - toggleColor fill from left
                                    HStack {
                                        Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    colors: [.accentColor.opacity(0.3), .accentColor.opacity(1.0)],
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .frame(width: toggleWidth * fillProgress, height: 30)
                                        
                                        Spacer(minLength: 0)
                                    }
                                } else {
                                    // Dragging left - gray "unfill" from right
                                    HStack {
                                        Spacer(minLength: 0)
                                        
                                        Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    colors: [Color.gray.opacity(0.8), Color.gray.opacity(0.1)],
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .frame(width: toggleWidth * (1.0 - fillProgress), height: 30)
                                    }
                                }
                            }
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            
                // Toggle thumb
                Circle()
                    .fill(isDragging ? Color.white.opacity(0.9) : Color.white.opacity(0.85))
                    .frame(width: thumbSize, height: thumbSize)
                    .glass()
                    .offset(x: isDragging ? dragOffset : (isOn ? maxOffset : -maxOffset))
                    .scaleEffect(isDragging ? 1.25 : 1.0)
                    .animation(.easeInOut(duration: 0.3), value: isDragging ? dragOffset : (isOn ? maxOffset : -maxOffset))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !isDragging {
                                    isDragging = true
                                    lastDragValue = value.translation.width
                                } else {
                                    // Calculate drag direction based on movement
                                    dragDirection = value.translation.width - lastDragValue
                                    lastDragValue = value.translation.width
                                }
                                
                                // Calculate position based on drag from initial position
                                let startPosition = isOn ? maxOffset : -maxOffset
                                let newOffset = startPosition + value.translation.width
                                dragOffset = min(maxOffset, max(-maxOffset, newOffset))
                            }
                            .onEnded { value in
                                let threshold: CGFloat = 0.0 // Use center as threshold
                                
                                let newState = dragOffset > threshold
                                
                                // Only animate if state actually changes
                                if newState != isOn {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isOn = newState
                                        isDragging = false
                                    }
                                } else {
                                    isDragging = false
                                }
                                
                                dragOffset = 0
                                dragDirection = 0
                                lastDragValue = 0
                            }
                    )
            }
        }
        .onTapGesture {
            withAnimation {
                isOn.toggle()
            }
        }
    }
}

#Preview("Dark") {
    Toggle()
        .preferredColorScheme(.dark)
}
