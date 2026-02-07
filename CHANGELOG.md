# Changelog

All notable changes to ModernOTP will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2026-02-06
Added

SMS Auto-Read Support: Added .textContentType(.oneTimeCode) for automatic OTP detection from SMS on iOS
OTP codes are now automatically detected and filled from SMS messages (iOS 12+)
No additional configuration needed - works out of the box!

Technical Details

Single line addition enables iOS built-in SMS OTP detection
Works with standard SMS formats (e.g., "Your code is 1234")
No permissions required - uses iOS native functionality
Only active on iOS (not macOS, tvOS, etc.)

## [1.0.1] - 2026-02-02

### Changed
- Updated default theme to use **orange** as the primary accent color
- Adjusted default surface and container appearance for a more modern look
- Aligned animated particle background default colors with the new theme
- Improved visual consistency across OTP input, container, and animations

### Fixed
- Improved SwiftUI color initialization for better cross-platform compatibility
- Minor visual inconsistencies between light and dark mode

### Notes
- No breaking API changes
- Existing configurations and custom themes continue to work as before

## [1.0.0] - 2026-02-01

### Added
- Initial release of ModernOTP
- `ModernOTPView` - Standalone OTP input component
- `OTPContainerView` - Complete OTP verification UI with background
- `AnimatedParticleBackground` - 3D particle animation effect
- `OTPConfiguration` - Customization for OTP input appearance
- `OTPContainerConfiguration` - Customization for container view
- `AnimatedBackgroundConfiguration` - Customization for particle animation
- Success and error callbacks
- Support for variable digit counts (4, 6, etc.)
- Customizable colors, fonts, and animations
- Dark mode support
- Comprehensive documentation and examples
- MIT License

### Features
- Smooth animations and transitions
- Number-only keyboard input
- Automatic validation
- Blinking caret indicator
- Success icon with draw animation
- Error flash feedback
- Customizable particle characters
- 3D rotation effect
- Morphing animation between chaos and sphere states
