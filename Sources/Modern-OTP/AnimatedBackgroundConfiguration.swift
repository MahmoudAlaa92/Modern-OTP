//
//  AnimatedBackgroundConfiguration.swift
//  ModernOTP
//
//  Created by Mahmoud Alaa on 01/02/2026.
//

import SwiftUI

/// Configuration for the animated particle background
@MainActor
public struct AnimatedBackgroundConfiguration {
    
    /// Number of particles to display
    public var particleCount: Int
    
    /// Color of the particles (in light mode)
    public var lightModeColor: Color
    
    /// Color of the particles (in dark mode)
    public var darkModeColor: Color
    
    /// Opacity of the particles
    public var particleOpacity: Double
    
    /// Rotation speed multiplier
    public var rotationSpeed: Double
    
    /// Minimum font size for particles
    public var minFontSize: CGFloat
    
    /// Maximum font size for particles
    public var maxFontSize: CGFloat
    
    /// Scale factor for chaos mode (random distribution)
    public var chaosScale: Double
    
    /// Scale factor for sphere mode
    public var sphereScale: Double
    
    /// Perspective distance for 3D effect
    public var perspectiveDistance: Double
    
    /// Whether to use numbers (0-9) or custom characters
    public var useNumbers: Bool
    
    /// Custom characters to use if useNumbers is false
    public var customCharacters: [String]
    
    // MARK: - Initializer
    
    public init(
        particleCount: Int = 200,
        lightModeColor: Color = .orange,
        darkModeColor: Color = .orange,
        particleOpacity: Double = 0.85,
        rotationSpeed: Double = 0.5,
        minFontSize: CGFloat = 1.0,
        maxFontSize: CGFloat = 10.0,
        chaosScale: Double = 250.0,
        sphereScale: Double = 100.0,
        perspectiveDistance: Double = 300.0,
        useNumbers: Bool = true,
        customCharacters: [String] = []
    ) {
        self.particleCount = particleCount
        self.lightModeColor = lightModeColor
        self.darkModeColor = darkModeColor
        self.particleOpacity = particleOpacity
        self.rotationSpeed = rotationSpeed
        self.minFontSize = minFontSize
        self.maxFontSize = maxFontSize
        self.chaosScale = chaosScale
        self.sphereScale = sphereScale
        self.perspectiveDistance = perspectiveDistance
        self.useNumbers = useNumbers
        self.customCharacters = customCharacters
    }
    
    /// Default configuration
    public static let `default` = AnimatedBackgroundConfiguration()
}
