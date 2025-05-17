<img width="150" alt="GK" src="https://github.com/user-attachments/assets/e8ef2a81-eed4-4b52-a253-1f4563fed631" />

# SwiftGlass

![Stable](https://img.shields.io/github/v/release/1998code/swiftglass?color=03A791&label=Stable)
![Beta](https://img.shields.io/github/v/release/1998code/swiftglass?include_prereleases&color=3A59D1&label=Beta)
![Build Test](https://img.shields.io/github/actions/workflow/status/1998code/swiftglass/swift.yml?branch=main&style=flat&label=Build&color=%237AE2CF)
![Swift Version](https://img.shields.io/badge/Swift-5.9/6.1-teal.svg)

![Platforms](https://img.shields.io/badge/Platforms-iOS%2015.0+%20|%20macOS%2014.0+%20|%20tvOS%2015.0+%20|%20watchOS%2010.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)

![SwiftGlass@3x](https://github.com/user-attachments/assets/7f289182-9717-4f42-a0d9-880d0fedaf86)

## Features

🔄 **Cross-platform**: Works on iOS, macOS, watchOS, tvOS, and visionOS<br/>
✨ **Native visionOS support**: Uses native glass effect on visionOS<br/>
🎨 **Highly customizable**: Adjust colors, materials, shadows, and more<br/>
🧩 **SwiftUI integration**: Simple ViewModifier implementation

## Gallery

| <img width="421" alt="Screenshot 2025-04-20 at 4 16 55 PM" src="https://github.com/user-attachments/assets/062a85c7-6269-4aee-a9b3-b2b336f2c3b0" /> | ![image](https://github.com/user-attachments/assets/1f5e3ceb-aff1-4f9a-a296-5713fa9164ca) | ![image](https://github.com/user-attachments/assets/f1417fa5-a3de-40f4-abd8-a1de2c9fe59d) |
| -- | -- | -- |
| iOS | watchOS I | watchOS II |

| ![image](https://github.com/user-attachments/assets/0a5a65f3-7162-4a3b-aa58-97789803a37a) | ![image](https://github.com/user-attachments/assets/06195623-cf4b-427d-a4ec-17912c00ca10) |
| -- | -- |
| macOS (Dark) I | macOS (Dark) II |

| ![image](https://github.com/user-attachments/assets/42febaa1-3ddd-4e04-b811-940e1e099ce4) | ![image](https://github.com/user-attachments/assets/594674a4-391e-46e6-a92f-411e6fbbca70) |
| -- | -- |
| tvOS I | tvOS II |

| ![image](https://github.com/user-attachments/assets/23067498-c552-48bc-b80a-e5c51d82dbd1) | ![image](https://github.com/user-attachments/assets/52d0a618-5c06-41ba-9687-dac7bbf34a35) |
| -- | -- |
| visionOS | iPadOS |

## Tested Platforms and Environment

| Platform | iOS | macOS | watchOS | tvOS | visionOS |
| -- | -- | -- | -- | -- | -- |
| Version | 15.0+ | 14.0+ | 10.0+ | 15.0+ | 1.0+ |

| Xcode Latest | Minimum | SVT |
| -- | -- | -- |
| 16.3 | 15.0 | 5.9 |

![image](https://github.com/user-attachments/assets/99794cda-e879-4194-85fb-f6350ddf9db8)

## Project Demo (Quick Starter)

```
Open /Demo/Demo.xcodeproj
```
>⚠️ To prevent resolving failed, please rename the root folder from SwiftGlass-xxx to SwiftGlass

## Installation (on your project)

### Swift Package Manager

Add SwiftGlass to your project through Swift Package Manager 

>PROJECT > Package Dependencies > +
```
https://github.com/1998code/SwiftGlass.git
```

<img width="1248" alt="Screenshot 2025-04-20 at 4 29 46 PM" src="https://github.com/user-attachments/assets/443f3489-c8b2-4d4f-a716-0003ecab5951" />

> Or you may add it manually as follows

```swift
dependencies: [
    .package(url: "https://github.com/1998code/SwiftGlass.git", from: "1.0.0")
]
```

## Usage

### Basic Usage (View / Button / Anywhere)

<img width="328" alt="Screenshot 2025-04-20 at 2 41 51 PM" src="https://github.com/user-attachments/assets/1c64b4a6-7e10-4ee8-8e81-a731891a10fb" />


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

<img width="328" alt="Screenshot 2025-04-20 at 2 40 11 PM" src="https://github.com/user-attachments/assets/0c2c234a-2c74-4262-9a54-23d62ba03815" />

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

MIT. Read the LICENSE file for details.

## Translation

This doc is also available in:

English | [繁中](/README/README_tc.md) / [简中](/README/README_zh.md) / [粵語](/README/README_hc.md) | [日本語](/README/README_ja.md) | [한국어](/README/README_ko.md)

Please feel free to open a pull request and add new language(s) or fix any typos/mistakes.

## Supported By
<a href="https://m.do.co/c/ce873177d9ab">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg" width="201px">
</a>

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/1998code/SwiftGlass)
