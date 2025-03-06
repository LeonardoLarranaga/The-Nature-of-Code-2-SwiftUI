//
//  0.3 - A Walker That Tends to Move to the Right.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 2/23/25.
//

import SwiftUI

struct WalkerTendsMoveRight: View {
    
    @Observable class Walker {
        var x: Double
        var y: Double
        
        init(width: Double, height: Double) {
            self.x = width / 2
            self.y = height / 2
        }
        
        func step() {
            let r = Double.random(in: 0...1)
            // A 40% chance of moving to the right.
            if r < 0.4 {
                x += 1
            } else if r < 0.6 {
                x -= 1
            } else if r < 0.8 {
                y += 1
            } else {
                y -= 1
            }
        }
    }
    
    @State var walker = Walker(width: 1000, height: 500)
    @State var positions: [CGPoint] = []
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            for pos in positions {
                let rect = CGRect(x: pos.x, y: pos.y, width: 2, height: 2)
                context.fill(Path(rect), with: .color(.primary))
            }
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/120, repeats: true) { _ in
                walker.step()
                positions.append(CGPoint(x: walker.x, y: walker.y))
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .frame(width: 1000, height: 500)
        .navigationTitle("A Walker That Tends to Move to the Right")
    }
}

#Preview {
    WalkerTendsMoveRight()
}
