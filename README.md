# ModernOTP

A beautiful, customizable OTP (One-Time Password) input component for SwiftUI with an animated 3D particle background.

<p align="center">
  <img src="https://img.shields.io/badge/platform-iOS%2017%2B%20%7C%20macOS%2014%2B-blue" alt="Platform">
  <img src="https://img.shields.io/badge/Swift-6.0+-orange" alt="Swift Version">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License">
</p>

<p align="center">
  <img 
    src="https://github.com/user-attachments/assets/041979de-d31f-4414-9332-1152861244cc"
    width="200"
    height="300"
    alt="OTP Demo 1"
  />
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img 
    src="https://github.com/user-attachments/assets/6653d812-5dcf-4811-b8e6-52c810ebf50b"
    width="200"
    height="300"
    alt="OTP Demo 2"
  />
</p>


## Features

✨ **Highly Customizable** - Configure colors, fonts, animations, and more  
🎨 **Beautiful Animations** - Smooth transitions and 3D particle effects  
📱 **iOS & macOS Support** - Works on both platforms  
🎯 **Easy Integration** - Simple API with sensible defaults  
⚡ **Lightweight** - No external dependencies  
🔒 **Secure Input** - Number-only keyboard with validation

## Installation

### Swift Package Manager

Add ModernOTP to your project using Xcode:

1. File → Add Package Dependencies
2. Enter package URL: `https://github.com/MahmoudAlaa92/Modern-OTP.git`
3. Select version/branch
4. Add to your target

Or add it to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/MahmoudAlaa92/Modern-OTP.git", from: "1.0.1")
]
```

## Quick Start

### Basic Usage
```swift
import SwiftUI
import ModernOTP

struct ContentView: View {
    @State private var isSuccess = false
    
    var body: some View {
        OTPContainerView(
            expectedCode: "1234",
            isSuccess: $isSuccess
        )
    }
}
```

### OTP Input Only

If you want just the OTP input without the container:
```swift
import SwiftUI
import ModernOTP

struct ContentView: View {
    @State private var isSuccess = false
    
    var body: some View {
        ModernOTPView(
            digitCount: 6,
            expectedCode: "123456",
            isSuccess: $isSuccess
        )
        .padding()
    }
}
```

## Customization

### OTP Input Styling
```swift
let otpConfig = OTPConfiguration(
    cellWidth: 60,
    cellHeight: 60,
    cellCornerRadius: 16,
    cellSpacing: 16,
    activeBorderColor: .blue,
    successBorderColor: .green,
    errorBorderColor: .red,
    textColor: .primary,
    digitFont: .system(size: 28, weight: .bold),
    successIconName: "checkmark.circle.fill",
    successIconColor: .green
)

OTPContainerView(
    expectedCode: "1234",
    isSuccess: $isSuccess,
    otpConfig: otpConfig
)
```

### Container Styling
```swift
let containerConfig = OTPContainerConfiguration(
    backgroundColor: .black,
    surfaceColor: Color(.systemGray6),
    containerCornerRadius: 32,
    borderColor: .blue,
    titleText: "Verify Your Identity",
    titleFont: .largeTitle.bold(),
    subtitleText: "Enter the 6-digit code we sent to your device.",
    showAnimatedBackground: true
)

OTPContainerView(
    expectedCode: "123456",
    digitCount: 6,
    isSuccess: $isSuccess,
    containerConfig: containerConfig
)
```

### Animated Background
```swift
let animationConfig = AnimatedBackgroundConfiguration(
    particleCount: 300,
    lightModeColor: .orange,
    darkModeColor: .orange,
    particleOpacity: 0.7,
    rotationSpeed: 1.0,
    useNumbers: false,
    customCharacters: ["★", "◆", "●", "■", "▲"]
)

OTPContainerView(
    expectedCode: "1234",
    isSuccess: $isSuccess,
    animationConfig: animationConfig
)
```

### Callbacks
```swift
OTPContainerView(
    expectedCode: "1234",
    isSuccess: $isSuccess,
    onSuccess: {
        print("OTP verified successfully!")
        // Navigate to next screen, etc.
    },
    onError: {
        print("Invalid OTP entered")
        // Show error message, haptic feedback, etc.
    }
)
```

## Configuration Options

### OTPConfiguration

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `cellWidth` | `CGFloat` | `55` | Width of each OTP cell |
| `cellHeight` | `CGFloat` | `55` | Height of each OTP cell |
| `cellCornerRadius` | `CGFloat` | `12` | Corner radius of cells |
| `cellSpacing` | `CGFloat` | `12` | Spacing between cells |
| `normalBorderColor` | `Color` | `.gray.opacity(0.3)` | Border color for inactive cells |
| `activeBorderColor` | `Color` | `.orange` | Border color for active cell |
| `successBorderColor` | `Color` | `.orange` | Border color on success |
| `errorBorderColor` | `Color` | `.red` | Border color on error |
| `textColor` | `Color` | `.gray` | Color of entered digits |
| `caretColor` | `Color` | `.primary` | Color of blinking caret |
| `digitFont` | `Font` | `.title` | Font for digits |
| `successIconName` | `String` | `"checkmark"` | SF Symbol for success |
| `successIconColor` | `Color` | `.orange` | Color of success icon |
| `successIconFont` | `Font` | `.system(size: 30)` | Font for success icon |
| `errorFlashDuration` | `Double` | `1.0` | Duration of error flash |

### OTPContainerConfiguration

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `backgroundColor` | `Color` | `.white` | Screen background color |
| `surfaceColor` | `Color` | `.gray.opacity(0.1)` | Container card color |
| `containerCornerRadius` | `CGFloat` | `24` | Container corner radius |
| `borderColor` | `Color` | `.orange` | Container border color |
| `showBorder` | `Bool` | `true` | Show container border |
| `titleText` | `String` | `"Enter the code"` | Main title text |
| `subtitleText` | `String` | `"We sent you a code..."` | Description text |
| `titleFont` | `Font` | `.title` | Title font |
| `titleColor` | `Color` | `.orange` | Title color |
| `subtitleFont` | `Font` | `.body` | Subtitle font |
| `subtitleColor` | `Color` | `.gray` | Subtitle color |
| `showAnimatedBackground` | `Bool` | `true` | Show particle animation |

### AnimatedBackgroundConfiguration

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `particleCount` | `Int` | `200` | Number of particles |
| `lightModeColor` | `Color` | `.orange` | Particle color (light) |
| `darkModeColor` | `Color` | `.orange` | Particle color (dark) |
| `particleOpacity` | `Double` | `0.85` | Particle opacity |
| `rotationSpeed` | `Double` | `0.5` | Rotation speed |
| `useNumbers` | `Bool` | `true` | Use numbers (0-9) |
| `customCharacters` | `[String]` | `[]` | Custom characters |

## Advanced Examples

### Custom Theme
```swift
struct CustomOTPView: View {
    @State private var isSuccess = false
    
    var body: some View {
        let otpConfig = OTPConfiguration(
            cellWidth: 65,
            cellHeight: 65,
            cellCornerRadius: 20,
            activeBorderColor: .purple,
            successBorderColor: .mint,
            errorBorderColor: .pink,
            digitFont: .system(size: 32, weight: .heavy, design: .rounded),
            successIconName: "star.fill"
        )
        
        let containerConfig = OTPContainerConfiguration(
            backgroundColor: Color(.systemIndigo),
            surfaceColor: Color(.systemBackground),
            borderColor: .purple,
            titleText: "🔐 Secure Access",
            titleFont: .system(size: 34, weight: .black, design: .rounded),
            subtitleText: "Please enter your verification code"
        )
        
        let animationConfig = AnimatedBackgroundConfiguration(
            particleCount: 150,
            lightModeColor: .purple.opacity(0.3),
            darkModeColor: .purple.opacity(0.6),
            rotationSpeed: 0.3
        )
        
        return OTPContainerView(
            expectedCode: "9876",
            digitCount: 4,
            isSuccess: $isSuccess,
            containerConfig: containerConfig,
            otpConfig: otpConfig,
            animationConfig: animationConfig,
            onSuccess: {
                print("Access granted!")
            }
        )
    }
}
```

### Minimal Style
```swift
let otpConfig = OTPConfiguration(
    normalBorderColor: .gray.opacity(0.2),
    activeBorderColor: .black,
    successBorderColor: .black,
    errorBorderColor: .black,
    textColor: .black,
    digitFont: .system(size: 24, weight: .medium, design: .monospaced)
)

let containerConfig = OTPContainerConfiguration(
    backgroundColor: .white,
    surfaceColor: .white,
    showBorder: false,
    titleFont: .system(size: 28, weight: .semibold),
    subtitleFont: .system(size: 16),
    showAnimatedBackground: false
)

OTPContainerView(
    expectedCode: "1234",
    isSuccess: $isSuccess,
    containerConfig: containerConfig,
    otpConfig: otpConfig
)
```

## Components

### OTPContainerView
Complete OTP verification UI with animated background, title, subtitle, and input.

### ModernOTPView
Standalone OTP input component without container or background.

### AnimatedParticleBackground
3D particle animation that can be used independently.

## Requirements

- **iOS 17.0+** / **macOS 14.0+**
- **Swift 6.0+**
- **Xcode 16.0+**

## License

ModernOTP is available under the MIT license. See LICENSE for details.

## Author

Mahmoud Alaa  
GitHub: [@MahmoudAlaa92](https://github.com/MahmoudAlaa92)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Support

If you have any questions or issues, please [open an issue](https://github.com/MahmoudAlaa92/Modern-OTP/issues) on GitHub.

## Acknowledgments

⭐ If you find this package useful, please star the repository!

---

Made with ❤️ by Mahmoud Alaa
