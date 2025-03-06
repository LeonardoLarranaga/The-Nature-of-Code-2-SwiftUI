//
//  0.6 - A Perlin Noise Walker.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/1/25.
//

import SwiftUI
import GameplayKit

struct PerlinNoiseWalker: View {
    
    @Observable class Walker {
        var x: Double = 0
        var y: Double = 0
        var tX: Double = 0
        var tY: Double = 10000
        
        let noise = GKNoise(GKPerlinNoiseSource())
        
        func step(in size: CGSize) {
            // x- and y-position mapped from noise.
            let valueX = noise.value(atPosition: SIMD2<Float>(x: Float(tX), y: 0))
            let valueY = noise.value(atPosition: SIMD2<Float>(x: Float(tY), y: 0))
            
            // GKPerlinNoiseSource returns values between -1 and 1, not between 0 and 1.
            x = map(Double(valueX), from: -1...1, to: 0...size.width)
            y = map(Double(valueY), from: -1...1, to: 0...size.height)
            
            // Move forward through time (but it's not really time).
            tX += 0.001
            tY += 0.001
        }
    }
    
    @State var walker = Walker()
    @State var size = CGSize.zero
    @State var timer: Timer?
    @State var positions: [CGPoint] = []
    
    var body: some View {
        Canvas { context, size in
            DispatchQueue.main.async {
                self.size = size
            }
            
            for pos in positions {
                let rect = CGRect(x: pos.x, y: pos.y, width: 50, height: 50)
                context.fill(Path(ellipseIn: rect), with: .color(.gray))
                context.stroke(Path(ellipseIn: rect), with: .color(.primary), lineWidth: 2)
            }
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/120, repeats: true) { _ in
                walker.step(in: size)
                positions.append(CGPoint(x: walker.x, y: walker.y))
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("A Perlin Noise Walker")
    }
}

#Preview {
    PerlinNoiseWalker()
}
