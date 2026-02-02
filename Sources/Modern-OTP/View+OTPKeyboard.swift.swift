//
//  View+OTPKeyboard.swift
//  Modern-OTP
//
//  Created by Mahmoud Alaa on 02/02/2026.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func otpKeyboardType() -> some View {
        #if os(iOS) || os(tvOS) || os(visionOS)
        self.keyboardType(.numberPad)
        #else
        self
        #endif
    }
}
