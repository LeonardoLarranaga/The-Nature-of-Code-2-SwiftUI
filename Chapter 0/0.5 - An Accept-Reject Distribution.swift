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
                context.fill(Path(rect), with: .color(.black))
                context.stroke(Path(rect), with: .color(.gray), lineWidth: 3)
            }
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/120, repeats: true) { _ in
                DispatchQueue.main.async {
                    let random = Int(acceptReject() * Double(randomCounts.count))
                    randomCounts[random] += 1
                }
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("An Accept-Reject Distribution")
    }
    
    func acceptReject() -> Double {
        while true {
            let r1 = Double.random(in: 0...1)
            let probability = r1 * r1
            let r2 = Double.random(in: 0...1)
            if r2 < probability {
                return r1
            }
        }
    }
}

#Preview {
    AcceptRejectDistribution()
}
