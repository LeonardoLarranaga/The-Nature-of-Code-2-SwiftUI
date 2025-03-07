//
//  1.6 - Normalizing a Vector.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import SwiftUI
import simd

struct NormalizingAVector: View {
    
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
                }, with: .color(.gray.opacity(0.5)), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                
                // In this example after the vector is normalized, it's multiplied by 50. Note that no matter where the mouse is, the vector always has the same value (50) because of the normalization process.
                let normalized = normalize(sub) * 50
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: normalized.point)
                }, with: .color(.primary), style: StrokeStyle(lineWidth: 8, lineCap: .round))
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.mouse = value.location.vector
                    }
            )
        }
        .navigationTitle("Normalizing a Vector")
    }
}

#Preview {
    NormalizingAVector()
}
