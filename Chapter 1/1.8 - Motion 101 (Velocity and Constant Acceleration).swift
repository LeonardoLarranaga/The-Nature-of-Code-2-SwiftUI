//
//  1.8 - Motion 101 (Velocity and Constant Acceleration).swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/20/25.
//

import SwiftUI

struct Motion101VelocityConstantAcceleration: View {
    @State var width = 0.0
    @State var height = 0.0
    
    @Observable class Mover {
        var position: SIMD2<Double>
        var velocity: SIMD2<Double>
        // Acceleration is the key!
        var acceleration: SIMD2<Double>
        // The variable topSpeed will limit the magnitude of velocity.
        var topSpeed: Double
        
        init(width: Double, height: Double) {
            self.position = SIMD2(x: .random(in: 0...width), y: .random(in: 0...height))
            self.velocity = SIMD2(x: .random(in: -2...2), y: .random(in: -2...2))
            self.acceleration = SIMD2(x: -0.001, y: 0.01)
            self.topSpeed = 10
        }
        
        func update() {
            // Velocity changes by acceleration and is limited by topSpeed.
            velocity += acceleration
            velocity.limit(to: topSpeed)
            position += velocity
        }
        
        func show(with context: inout GraphicsContext) {
            context.fill(Path(ellipseIn: CGRect(x: position.x, y: position.y, width: 50, height: 50)), with: .color(.gray))
            context.stroke(Path(ellipseIn: CGRect(x: position.x, y: position.y, width: 50, height: 50)), with: .color(.primary), lineWidth: 2)
        }
        
        func checkEdges(width: Double, height: Double) {
            if position.x > width {
                position.x = 0
            } else if position.x < 0 {
                position.x = width
            }
            
            if position.y > height {
                position.y = 0
            } else if position.y < 0 {
                position.y = height
            }
        }
    }
    
    // Declare the Mover object.
    @State var mover: Mover?
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            DispatchQueue.main.async {
                if mover == nil {
                    self.width = Double(size.width)
                    self.height = Double(size.height)
                    mover = Mover(width: width, height: height)
                }
            }
            mover?.show(with: &context)
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/120, repeats: true) { _ in
                mover?.update()
                mover?.checkEdges(width: width, height: height)
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("Motion 101 (Velocity and Constant Acceleration)")
    }
}

#Preview {
    Motion101VelocityConstantAcceleration()
}
