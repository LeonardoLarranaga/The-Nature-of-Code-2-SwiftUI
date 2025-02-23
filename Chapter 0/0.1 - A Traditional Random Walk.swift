//
//  0.1 - A Traditional Random Walk.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 2/23/25.
//

import SwiftUI

struct TraditionalRandomWalk: View {
    
    @Observable class Walker {
        var x: Double
        var y: Double
        
        init(width: Double, height: Double) {
            self.x = width / 2
            self.y = height / 2
        }
        
        func step() {
            let choice = Int.random(in: 0...3)
            switch choice {
            case 0:
                x += 1
            case 1:
                x -= 1
            case 2:
                y += 1
            default:
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
                context.fill(Path(rect), with: .color(.black))
            }
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/120, repeats: true) { _ in
                DispatchQueue.main.async {
                    walker.step()
                    positions.append(CGPoint(x: walker.x, y: walker.y))
                }
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .frame(width: 1000, height: 500)
        .navigationTitle("A Traditional Random Walk")
    }
}

#Preview {
    TraditionalRandomWalk()
}
