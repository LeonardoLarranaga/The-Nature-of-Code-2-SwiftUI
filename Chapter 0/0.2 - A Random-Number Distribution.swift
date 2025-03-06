//
//  0.2 - A Random-Number Distribution.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 2/23/25.
//

import SwiftUI

struct RandomNumberDistribution: View {
    
    // An array to keep track of how often random numbers are picked.
    @State var randomCounts = Array(repeating: 0, count: 20)
    // The total number of counts.
    var total: Int { randomCounts.count }
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            let barWidth = size.width / CGFloat(randomCounts.count)
            // Graph the results.
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
                // Pick a random number and increase the count.
                let index = Int.random(in: 0..<total)
                randomCounts[index] += 1
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("A Random-Number Distribution")
    }
}

#Preview {
    RandomNumberDistribution()
}
