//
//  1.2 - Bouncing Ball with Vectors!.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import SwiftUI

struct BouncingBallWithVectors: View {
    
    // Instead of a bunch of floats, you know have just two variables.
    @State var position = SIMD2(x: 100, y: 100.0)
    @State var velocity = SIMD2(x: 2.5, y: 2.0)
    
    @State var size = CGSize.zero
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            DispatchQueue.main.async { self.size = size }
            
            context.fill(Path(ellipseIn: CGRect(x: position.x, y: position.y, width: 50, height: 50)), with: .color(.gray))
            context.stroke(Path(ellipseIn: CGRect(x: position.x, y: position.y, width: 50, height: 50)), with: .color(.primary), lineWidth: 2)
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { _ in
                position += velocity
                // You still sometimes need to refer to the individual components of the vector and can do so using the dot syntax: position.x, position.y, and so forth.
                if position.x > size.width || position.x < 0 {
                    velocity.x *= -1
                }
                if position.y > size.height || position.y < 0 {
                    velocity.y *= -1
                }
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("Bouncing Ball with Vectors!")
    }
}

#Preview {
    BouncingBallWithVectors()
}
