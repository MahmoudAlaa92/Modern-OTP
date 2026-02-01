//
//  OTPContainerConfiguration.swift
//  ModernOTP
//
//  Created by Mahmoud Alaa on 01/02/2026.
//

import SwiftUI

/// Configuration for the OTP container view appearance
@MainActor
public struct OTPContainerConfiguration {
    
    // MARK: - Background
    
    /// Primary background color for the screen
    public var backgroundColor: Color
    
    /// Surface color for the container card
    public var surfaceColor: Color
    
    /// Corner radius of the container card
    public var containerCornerRadius: CGFloat
    
    /// Horizontal padding of the container
    public var containerHorizontalPadding: CGFloat
    
    /// Height of the container
    public var containerHeight: CGFloat
    
    // MARK: - Border
    
    /// Whether to show a border around the container
    public var showBorder: Bool
    
    /// Border color
    public var borderColor: Color
    
    /// Border width
    public var borderWidth: CGFloat
    
    // MARK: - Text
    
    /// Title text (e.g., "Enter the code")
    public var titleText: String
    
    /// Title font
    public var titleFont: Font
    
    /// Title color
    public var titleColor: Color
    
    /// Subtitle/description text
    public var subtitleText: String
    
    /// Subtitle font
    public var subtitleFont: Font
    
    /// Subtitle color
    public var subtitleColor: Color
    
    /// Horizontal padding for subtitle
    public var subtitleHorizontalPadding: CGFloat
    
    // MARK: - Animation View
    
    /// Whether to show the animated background (particle sphere)
    public var showAnimatedBackground: Bool
    
    /// Scale factor for the animated background
    public var animatedBackgroundScale: CGFloat
    
    /// Height of the animated background frame
    public var animatedBackgroundHeight: CGFloat
    
    // MARK: - Spacing
    
    /// Vertical spacing between elements in the container
    public var verticalSpacing: CGFloat
    
    // MARK: - Initializer
    
    public init(
        backgroundColor: Color = .primary,
        surfaceColor: Color = .white,
        containerCornerRadius: CGFloat = 24,
        containerHorizontalPadding: CGFloat = 20,
        containerHeight: CGFloat = 455,
        showBorder: Bool = true,
        borderColor: Color = .orange,
        borderWidth: CGFloat = 2,
        titleText: String = "Enter the code",
        titleFont: Font = .title,
        titleColor: Color = .primary,
        subtitleText: String = "We sent you a code to your email, please enter to verify your address.",
        subtitleFont: Font = .body,
        subtitleColor: Color = .secondary,
        subtitleHorizontalPadding: CGFloat = 20,
        showAnimatedBackground: Bool = true,
        animatedBackgroundScale: CGFloat = 0.9,
        animatedBackgroundHeight: CGFloat = 200,
        verticalSpacing: CGFloat = 24
    ) {
        self.backgroundColor = backgroundColor
        self.surfaceColor = surfaceColor
        self.containerCornerRadius = containerCornerRadius
        self.containerHorizontalPadding = containerHorizontalPadding
        self.containerHeight = containerHeight
        self.showBorder = showBorder
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.titleText = titleText
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.subtitleText = subtitleText
        self.subtitleFont = subtitleFont
        self.subtitleColor = subtitleColor
        self.subtitleHorizontalPadding = subtitleHorizontalPadding
        self.showAnimatedBackground = showAnimatedBackground
        self.animatedBackgroundScale = animatedBackgroundScale
        self.animatedBackgroundHeight = animatedBackgroundHeight
        self.verticalSpacing = verticalSpacing
    }
    
    /// Default configuration
    public static let `default` = OTPContainerConfiguration()
}
