//
//  AnimatedParticleBackground.swift
//  ModernOTP
//
//  Created by Mahmoud Alaa on 01/02/2026.
//

import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    let randomX: Double
    let randomY: Double
    let randomZ: Double
    let character: String
}

/// An animated 3D particle background that morphs between chaos and sphere
public struct AnimatedParticleBackground: View {
    
    @State private var morphAmount: Double = 100
    @State private var particles: [Particle] = []
    @Environment(\.colorScheme) private var colorScheme
    
    private let configuration: AnimatedBackgroundConfiguration
    
    // MARK: - Initializer
    
    public init(configuration: AnimatedBackgroundConfiguration = .default) {
        self.configuration = configuration
    }
    
    // MARK: - Body
    
    public var body: some View {
        GeometryReader { geometry in
            let centerX = geometry.size.width / 2
            let centerY = geometry.size.height / 2
            
            TimelineView(.animation) { timeline in
                let time = timeline.date.timeIntervalSinceReferenceDate
                let tMorph = morphAmount / 100.0
                let rotation = time * configuration.rotationSpeed
                
                let count = particles.count
                
                let positions = (0..<count).map { i -> (scaledX: Double, scaledY: Double, scaledZ: Double) in
                    let goldenAngle = Double.pi * (3 - sqrt(5))
                    let y = 1 - (Double(i) / Double(count - 1)) * 2
                    let radiusAtY = sqrt(1 - y * y)
                    let theta = goldenAngle * Double(i)
                    
                    let sphereX = radiusAtY * cos(theta)
                    let sphereZ = radiusAtY * sin(theta)
                    
                    let x = interpolate(from: particles[i].randomX, to: sphereX, t: tMorph)
                    let yPos = interpolate(from: particles[i].randomY, to: y, t: tMorph)
                    let z = interpolate(from: particles[i].randomZ, to: sphereZ, t: tMorph)
                    
                    let chaosScale = interpolate(from: configuration.chaosScale, to: configuration.sphereScale, t: tMorph)
                    return (x * chaosScale, yPos * chaosScale, z * chaosScale)
                }
                
                ZStack {
                    ForEach(0..<count, id: \.self) { i in
                        let pos = positions[i]
                        
                        let rotatedX = pos.scaledX * cos(rotation) - pos.scaledZ * sin(rotation)
                        let rotatedZ = pos.scaledX * sin(rotation) + pos.scaledZ * cos(rotation)
                        
                        let perspective = configuration.perspectiveDistance / (configuration.perspectiveDistance + rotatedZ)
                        let screenX = rotatedX * perspective
                        let screenY = pos.scaledY * perspective
                        let size = max(configuration.minFontSize, configuration.maxFontSize * perspective)
                        
                        let color = colorScheme == .dark ? configuration.darkModeColor : configuration.lightModeColor
                        
                        Text(particles[i].character)
                            .font(.system(size: size))
                            .foregroundColor(color)
                            .position(x: centerX + screenX, y: centerY + screenY)
                            .opacity(configuration.particleOpacity)
                    }
                }
            }
        }
        .onAppear {
            if particles.count != configuration.particleCount {
                particles = (0..<configuration.particleCount).map { _ in generateRandomParticle() }
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func interpolate(from: Double, to: Double, t: Double) -> Double {
        from * (1 - t) + to * t
    }
    
    private func generateRandomParticle() -> Particle {
        let u = Double.random(in: 0...1)
        let v = Double.random(in: 0...1)
        let theta = u * 2 * .pi
        let phi = acos(2 * v - 1)
        let r = pow(Double.random(in: 0...1), 1.0 / 3.0)
        
        let x = r * sin(phi) * cos(theta)
        let y = r * sin(phi) * sin(theta)
        let z = r * cos(phi)
        
        let character: String
        if configuration.useNumbers {
            character = String(Int.random(in: 0...9))
        } else if !configuration.customCharacters.isEmpty {
            character = configuration.customCharacters.randomElement() ?? "•"
        } else {
            character = String(Int.random(in: 0...9))
        }
        
        return Particle(randomX: x, randomY: y, randomZ: z, character: character)
    }
}

// MARK: - Preview

#Preview {
    AnimatedParticleBackground()
        .frame(height: 200)
        .background(Color.orange)
}
