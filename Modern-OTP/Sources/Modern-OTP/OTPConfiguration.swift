//
//  OTPConfiguration.swift
//  ModernOTP
//
//  Created by Mahmoud Alaa on 01/02/2026.
//

import SwiftUI

/// Configuration for customizing the OTP input appearance and behavior
public struct OTPConfiguration {
    
    // MARK: - Cell Appearance
    
    /// Width of each OTP cell
    public var cellWidth: CGFloat
    
    /// Height of each OTP cell
    public var cellHeight: CGFloat
    
    /// Corner radius of each OTP cell
    public var cellCornerRadius: CGFloat
    
    /// Spacing between OTP cells
    public var cellSpacing: CGFloat
    
    /// Border width for normal state
    public var normalBorderWidth: CGFloat
    
    /// Border width for active/error/success states
    public var highlightedBorderWidth: CGFloat
    
    // MARK: - Colors
    
    /// Border color for normal (inactive) state
    public var normalBorderColor: Color
    
    /// Border color when cell is active (focused)
    public var activeBorderColor: Color
    
    /// Border color on successful validation
    public var successBorderColor: Color
    
    /// Border color on validation error
    public var errorBorderColor: Color
    
    /// Text color for entered digits
    public var textColor: Color
    
    /// Color of the blinking caret
    public var caretColor: Color
    
    // MARK: - Typography
    
    /// Font for the OTP digits
    public var digitFont: Font
    
    /// Font for the success icon
    public var successIconFont: Font
    
    // MARK: - Success Icon
    
    /// System icon name to show on success
    public var successIconName: String
    
    /// Color of the success icon
    public var successIconColor: Color
    
    // MARK: - Animation
    
    /// Duration of the caret blink animation
    public var caretBlinkDuration: Double
    
    /// Duration of the success icon draw animation
    public var successIconDrawDuration: Double
    
    /// Duration of the error flash before clearing
    public var errorFlashDuration: Double
    
    /// Caret width
    public var caretWidth: CGFloat
    
    /// Caret height
    public var caretHeight: CGFloat
    
    // MARK: - Initializer
    
    public init(
        cellWidth: CGFloat = 55,
        cellHeight: CGFloat = 55,
        cellCornerRadius: CGFloat = 12,
        cellSpacing: CGFloat = 12,
        normalBorderWidth: CGFloat = 1,
        highlightedBorderWidth: CGFloat = 2,
        normalBorderColor: Color = .gray.opacity(0.3),
        activeBorderColor: Color = .orange,
        successBorderColor: Color = .green,
        errorBorderColor: Color = .red,
        textColor: Color = .primary,
        caretColor: Color = .primary,
        digitFont: Font = .title,
        successIconFont: Font = .system(size: 30, weight: .regular),
        successIconName: String = "checkmark",
        successIconColor: Color = .green,
        caretBlinkDuration: Double = 0.1,
        successIconDrawDuration: Double = 2.0,
        errorFlashDuration: Double = 1.0,
        caretWidth: CGFloat = 2,
        caretHeight: CGFloat = 22
    ) {
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
        self.cellCornerRadius = cellCornerRadius
        self.cellSpacing = cellSpacing
        self.normalBorderWidth = normalBorderWidth
        self.highlightedBorderWidth = highlightedBorderWidth
        self.normalBorderColor = normalBorderColor
        self.activeBorderColor = activeBorderColor
        self.successBorderColor = successBorderColor
        self.errorBorderColor = errorBorderColor
        self.textColor = textColor
        self.caretColor = caretColor
        self.digitFont = digitFont
        self.successIconFont = successIconFont
        self.successIconName = successIconName
        self.successIconColor = successIconColor
        self.caretBlinkDuration = caretBlinkDuration
        self.successIconDrawDuration = successIconDrawDuration
        self.errorFlashDuration = errorFlashDuration
        self.caretWidth = caretWidth
        self.caretHeight = caretHeight
    }
    
    /// Default configuration
    public static let `default` = OTPConfiguration()
}
