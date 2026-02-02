//
//  ModernOTPView.swift
//  ModernOTP
//
//  Created by Mahmoud Alaa on 01/02/2026.
//

import SwiftUI

/// A modern, animated OTP input view with customizable appearance
public struct ModernOTPView: View {
    
    // MARK: - Properties
    
    @FocusState private var focusedField: Bool
    @State private var value = ""
    @State private var isErrorFlash = false
    @State private var showCaret = false
    @State private var isDone = false
    
    private let digitCount: Int
    private let expectedCode: String
    private let configuration: OTPConfiguration
    private let onSuccess: (() -> Void)?
    private let onError: (() -> Void)?
    
    @Binding private var isSuccess: Bool
    
    // MARK: - Initializer
    
    /// Creates a new OTP input view
    /// - Parameters:
    ///   - digitCount: Number of OTP digits (default: 4)
    ///   - expectedCode: The correct OTP code to validate against
    ///   - isSuccess: Binding to track success state
    ///   - configuration: Visual configuration (default: .default)
    ///   - onSuccess: Optional callback when validation succeeds
    ///   - onError: Optional callback when validation fails
    public init(
        digitCount: Int = 4,
        expectedCode: String,
        isSuccess: Binding<Bool>,
        configuration: OTPConfiguration = .default,
        onSuccess: (() -> Void)? = nil,
        onError: (() -> Void)? = nil
    ) {
        self.digitCount = digitCount
        self.expectedCode = expectedCode
        self._isSuccess = isSuccess
        self.configuration = configuration
        self.onSuccess = onSuccess
        self.onError = onError
    }
    
    // MARK: - Body
    
    public var body: some View {
        ZStack {
            // Hidden text field to capture input
            TextField("", text: $value)
                // Only available on non-macOS Apple platforms
                #if os(iOS) || os(tvOS) || os(visionOS) || os(watchOS)
                .keyboardType(.numberPad)
                #endif
                .focused($focusedField)
                .opacity(0.001)
                .onChange(of: value) { _, newValue in
                    if newValue.count > digitCount {
                        value = String(newValue.prefix(digitCount))
                    }
                    if newValue.count == digitCount {
                        validate()
                    }
                }
            
            // Decide layout once
            let layout: AnyLayout = isSuccess
                ? AnyLayout(ZStackLayout())
                : AnyLayout(HStackLayout(spacing: configuration.cellSpacing))
            
            // Precompute active index
            let activeIndex = value.count == digitCount ? digitCount - 1 : value.count
            
            layout {
                ForEach(0..<digitCount, id: \.self) { index in
                    let isActive = focusedField && index == activeIndex && !isErrorFlash && !isSuccess
                    OTPCell(
                        character: character(at: index),
                        isActive: isActive,
                        isSuccess: isSuccess,
                        isErrorFlash: isErrorFlash,
                        showCaret: showCaret,
                        configuration: configuration
                    )
                    .allowsHitTesting(!isSuccess)
                }
            }
            .overlay(alignment: .center) {
                // Success checkmark overlay
                if isSuccess {
                    Image(systemName: configuration.successIconName)
                        .font(configuration.successIconFont)
                        .foregroundStyle(configuration.successIconColor)
                    
                        .transition(.opacity)
                        .scaleEffect(isDone ? 1.0 : 0.8)
                        .opacity(isDone ? 1.0 : 0.0)
                        .animation(.linear(duration: configuration.successIconDrawDuration), value: isDone)
                }
            }
        }
        .contentShape(Rectangle())
        .allowsHitTesting(!isSuccess)
        .onTapGesture { focusedField = true }
        .onAppear {
            withAnimation(.smooth(duration: configuration.caretBlinkDuration).repeatForever()) {
                showCaret.toggle()
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func character(at index: Int) -> String? {
        guard index < value.count else { return nil }
        let strIndex = value.index(value.startIndex, offsetBy: index)
        return String(value[strIndex])
    }
    
    private func validate() {
        if value == expectedCode {
            withAnimation {
                isSuccess = true
                focusedField = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isDone = true
            }
            onSuccess?()
        } else {
            isErrorFlash = true
            DispatchQueue.main.asyncAfter(deadline: .now() + configuration.errorFlashDuration) {
                value = ""
                isErrorFlash = false
                focusedField = true
            }
            onError?()
        }
    }
}

// MARK: - OTP Cell

private struct OTPCell: View {
    let character: String?
    let isActive: Bool
    let isSuccess: Bool
    let isErrorFlash: Bool
    let showCaret: Bool
    let configuration: OTPConfiguration
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: configuration.cellCornerRadius)
                .stroke(configuration.normalBorderColor, lineWidth: configuration.normalBorderWidth)
                .frame(width: configuration.cellWidth, height: configuration.cellHeight)
            
            if let character, !isSuccess {
                Text(character)
                    .font(configuration.digitFont)
                    .foregroundStyle(configuration.textColor)
            }
        }
        .overlay {
            ZStack {
                RoundedRectangle(cornerRadius: configuration.cellCornerRadius)
                    .stroke(strokeColor, lineWidth: strokeWidth)
                
                Rectangle()
                    .fill(configuration.caretColor)
                    .frame(width: configuration.caretWidth, height: configuration.caretHeight)
                    .opacity((showCaret && isActive) ? 1 : 0)
            }
        }
    }
    
    private var strokeColor: Color {
        if isErrorFlash { return configuration.errorBorderColor }
        if isSuccess { return configuration.successBorderColor }
        return isActive ? configuration.activeBorderColor : .clear
    }
    
    private var strokeWidth: CGFloat {
        (isErrorFlash || isSuccess || isActive) ? configuration.highlightedBorderWidth : 0
    }
}

// MARK: - Preview

#Preview {
    ModernOTPView(
        digitCount: 4,
        expectedCode: "1234",
        isSuccess: .constant(false)
    )
    .padding()
}
