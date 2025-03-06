//
//  0.4 - A Gaussian Distribution.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 2/23/25.
//

import SwiftUI
import GameplayKit

struct GaussianDistribution: View {
    
    @State var circlesX: [Int] = []
    @State var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            for x in circlesX {
                let circle = Path(ellipseIn: CGRect(x: x, y: Int(size.height) / 2, width: 25, height: 25))
                context.fill(circle, with: .color(.primary.opacity(0.3)))
            }
        }
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { _ in
                // A normal distribution with mean of 320 and standard deviation of 60.
                let random = GKGaussianDistribution(randomSource: GKRandomSource(), mean: 320, deviation: 60)
                circlesX.append(random.nextInt())
            }
        }
        .onDisappear(perform: timer?.invalidate)
        .navigationTitle("A Gaussian Distribution")
    }
}

#Preview {
    GaussianDistribution()
}
