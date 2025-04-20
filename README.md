# SwiftGlass

A lightweight Swift library that provides a consistent and customizable glass/frosted effect across Apple platforms.

![Swift Version](https://img.shields.io/badge/Swift-5.5-orange.svg)
![Platforms](https://img.shields.io/badge/platforms-iOS%2015.0+%20|%20macOS%2014.0+%20|%20tvOS%2015.0+%20|%20watchOS%2010.0+%20|%20visionOS%201.0+-lightgrey.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## Features

🔄 **Cross-platform**: Works on iOS, macOS, watchOS, tvOS, and visionOS<br/>
✨ **Native visionOS support**: Uses native glass effect on visionOS<br/>
🎨 **Highly customizable**: Adjust colors, materials, shadows, and more<br/>
🧩 **SwiftUI integration**: Simple ViewModifier implementation

## Tested Platforms and Environment

iOS 15.0+, macOS 14.0+, watchOS 10.0+, tvOS 15.0+, and visionOS 1.0+<br/>
Xcode 16.3 (Not Minimum Required)

## Installation

### Swift Package Manager

Add SwiftGlass to your project through Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/SwiftGlass.git", from: "1.0.0")
]
```

## Usage

### Basic Usage

```swift
import SwiftUI
import SwiftGlass

struct ContentView: View {
    var body: some View {
        Text("Hello, Glass!")
            .padding(40)
            .glass() // Use default glass effect
    }
}
```

### Custom Glass Effect

```swift
VStack {
    Text("Custom Glass")
    Image(systemName: "sparkles")
}
.padding(30)
.glass(
    radius: 20,
    color: .blue,
    material: .regularMaterial,
    gradientOpacity: 0.7,
    shadowColor: .blue,
    shadowRadius: 10
)
```

## Customization

SwiftGlass offers extensive customization options:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `displayMode` | `.always` or `.automatic` | `.always` | Controls when the effect is displayed |
| `radius` | `CGFloat` | `32` | Corner radius of the glass effect |
| `color` | `Color` | `.white` | Base color for gradient and highlights |
| `material` | `Material` | `.ultraThinMaterial` | SwiftUI material style |
| `gradientOpacity` | `Double` | `0.5` | Opacity level for the gradient overlay |
| `gradientStyle` | `.normal` or `.reverted` | `.normal` | Direction style of the gradient |
| `strokeWidth` | `CGFloat` | `1.5` | Width of the border stroke |
| `shadowColor` | `Color` | `.white` | Color of the drop shadow |
| `shadowOpacity` | `Double` | `0.5` | Opacity level for the shadow |
| `shadowRadius` | `CGFloat?` | `nil` | Blur radius for the shadow |
| `shadowX` | `CGFloat` | `0` | Horizontal offset of the shadow |
| `shadowY` | `CGFloat` | `5` | Vertical offset of the shadow |

## Platform-Specific Notes

- **visionOS**: On visionOS, SwiftGlass uses the native `.glassBackgroundEffect()` for optimal rendering and system integration
- **Other platforms**: A custom implementation combines materials, gradients, and shadows to achieve a similar effect

## Contributing

Contributions to SwiftGlass are welcome!

- To report bugs or request features, please open an issue on GitHub
- When submitting a pull request, please follow the coding style of the project

## License

MIT. Read LICENSE file for details.
