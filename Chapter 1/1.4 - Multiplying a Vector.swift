//
//  1.4 - Multiplying a Vector.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import SwiftUI

struct MultiplyingAVector: View {
    
    @State var mouse = SIMD2(x: 0.0, y: 0.0)
    
    var body: some View {
        VStack {
            Text("Drag to simulate the mouse location.")
                .foregroundStyle(.secondary)
            
            Canvas { context, size in
                let center = SIMD2(x: size.width / 2, y: size.height / 2)
                let sub = mouse - center
                
                context.translateBy(x: size.width / 2, y: size.height / 2)
                
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: sub.point)
                }, with: .color(.gray.opacity(0.5)), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                
                // Multiplying the vector! The vector is now half its original size (multiplied by 0.5).
                let mult = sub * 0.5
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: mult.point)
                }, with: .color(.primary), style: StrokeStyle(lineWidth: 20, lineCap: .round))
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.mouse = value.location.vector
                    }
            )
        }
        .navigationTitle("Multiplying a Vector")
    }
}

#Preview {
    MultiplyingAVector()
}
