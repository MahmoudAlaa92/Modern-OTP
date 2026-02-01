//
//  OTPContainerView.swift
//  ModernOTP
//
//  Created by Mahmoud Alaa on 01/02/2026.
//

import SwiftUI

/// A complete OTP verification view with animated background, title, subtitle, and OTP input
public struct OTPContainerView: View {
    
    // MARK: - Properties
    
    @Binding private var isSuccess: Bool
    
    private let expectedCode: String
    private let digitCount: Int
    private let containerConfig: OTPContainerConfiguration
    private let otpConfig: OTPConfiguration
    private let animationConfig: AnimatedBackgroundConfiguration
    private let onSuccess: (() -> Void)?
    private let onError: (() -> Void)?
    
    // MARK: - Initializer
    
    /// Creates a complete OTP verification view
    /// - Parameters:
    ///   - expectedCode: The correct OTP code to validate against
    ///   - digitCount: Number of OTP digits (default: 4)
    ///   - isSuccess: Binding to track success state
    ///   - containerConfig: Configuration for the container appearance
    ///   - otpConfig: Configuration for the OTP input appearance
    ///   - animationConfig: Configuration for the animated background
    ///   - onSuccess: Optional callback when validation succeeds
    ///   - onError: Optional callback when validation fails
    public init(
        expectedCode: String,
        digitCount: Int = 4,
        isSuccess: Binding<Bool>,
        containerConfig: OTPContainerConfiguration = .default,
        otpConfig: OTPConfiguration = .default,
        animationConfig: AnimatedBackgroundConfiguration = .default,
        onSuccess: (() -> Void)? = nil,
        onError: (() -> Void)? = nil
    ) {
        self.expectedCode = expectedCode
        self.digitCount = digitCount
        self._isSuccess = isSuccess
        self.containerConfig = containerConfig
        self.otpConfig = otpConfig
        self.animationConfig = animationConfig
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    // MARK: - Body
    
    public var body: some View {
        ZStack {
            containerConfig.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: containerConfig.verticalSpacing) {
                // Animated background
                if containerConfig.showAnimatedBackground {
                    AnimatedParticleBackground(configuration: animationConfig)
                        .scaleEffect(containerConfig.animatedBackgroundScale)
                        .frame(height: containerConfig.animatedBackgroundHeight)
                }
                
                // Title and subtitle
                VStack {
                    Text(containerConfig.titleText)
                        .font(containerConfig.titleFont)
                        .foregroundStyle(containerConfig.titleColor)
                    
                    Text(containerConfig.subtitleText)
                        .font(containerConfig.subtitleFont)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(containerConfig.subtitleColor)
                        .padding(.horizontal, containerConfig.subtitleHorizontalPadding)
                }
                
                // OTP Input
                ModernOTPView(
                    digitCount: digitCount,
                    expectedCode: expectedCode,
                    isSuccess: $isSuccess,
                    configuration: otpConfig,
                    onSuccess: onSuccess,
                    onError: onError
                )
            }
            .frame(height: containerConfig.containerHeight)
            .background(containerConfig.surfaceColor, in: .rect(cornerRadius: containerConfig.containerCornerRadius))
            .overlay(content: {
                if containerConfig.showBorder {
                    RoundedRectangle(cornerRadius: containerConfig.containerCornerRadius)
                        .stroke(lineWidth: containerConfig.borderWidth)
                        .foregroundStyle(containerConfig.borderColor)
                }
            })
            .padding(.horizontal, containerConfig.containerHorizontalPadding)
        }
    }
}

// MARK: - Preview

#Preview {
    OTPContainerView(
        expectedCode: "1234",
        isSuccess: .constant(false)
    )
}
