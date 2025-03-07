//
//  1.1 - Bouncing Ball with No Vectors.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import SwiftUI

struct BouncingBallWithNoVectors: View {
    
    // Variables for position and speed of ball.
    @State var x = 100.0
    @State var y = 100.0
    @State var xSpeed = 2.5
    @State var ySpeed = 2.0
    
    @State var size = CGSize.zero
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            DispatchQueue.main.async { self.size = size }
            
            // Draw the ball at position (x, y).
            context.fill(Path(ellipseIn: CGRect(x: x, y: y, width: 50, height: 50)), with: .color(.gray))
            context.stroke(Path(ellipseIn: CGRect(x: x, y: y, width: 50, height: 50)), with: .color(.primary), lineWidth: 2)
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
                // Move the ball according to its speed.
                x += xSpeed
                y += ySpeed
                // Check for bouncing.
                if x > size.width || x < 0 {
                    xSpeed *= -1
                }
                if y > size.height || y < 0 {
                    ySpeed *= -1
                }
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("Bouncing Ball with No Vectors")
    }
}

#Preview {
    BouncingBallWithNoVectors()
}
