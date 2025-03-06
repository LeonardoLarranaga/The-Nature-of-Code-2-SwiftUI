//
//  0.5 - An Accept-Reject Distribution.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/1/25.
//

import SwiftUI

struct AcceptRejectDistribution: View {
    
    @State var randomCounts = Array(repeating: 0, count: 20)
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            let barWidth = size.width / CGFloat(randomCounts.count)
            for (index, count) in randomCounts.enumerated() {
                let x = CGFloat(index) * barWidth
                let y = size.height - CGFloat(count)
                let rect = CGRect(x: x, y: y, width: 25, height: CGFloat(count))
                context.fill(Path(rect), with: .color(.primary))
                context.stroke(Path(rect), with: .color(.gray), lineWidth: 3)
            }
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/120, repeats: true) { _ in
                let random = Int(acceptReject() * Double(randomCounts.count))
                randomCounts[random] += 1
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("An Accept-Reject Distribution")
    }
    
    func acceptReject() -> Double {
        // Do this "forever" until you find a qualifying random value.
        while true {
            // Pick a random value.
            let r1 = Double.random(in: 0...1)
            // Assign a probability.
            let probability = r1
            // Pick a second random value.
            let r2 = Double.random(in: 0...1)
            // Does it qualify? If so, you're done!
            if r2 < probability {
                return r1
            }
        }
    }
}

#Preview {
    AcceptRejectDistribution()
}
