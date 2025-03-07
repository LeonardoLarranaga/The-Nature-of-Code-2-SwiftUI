//
//  1.3 - Vector Subtraction.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import SwiftUI

struct VectorSubtraction: View {
        
    // Two vectors, one for the mouse location and one for the center of the window.
    @State var mouse = SIMD2(x: 0.0, y: 0.0)
    @State var center = SIMD2(x: 0.0, y: 0.0)
    
    var body: some View {
        VStack {
            Text("Drag to simulate the mouse position.")
                .foregroundStyle(.secondary)
            
            Canvas { context, size in
                DispatchQueue.main.async {
                    self.center = SIMD2(x: size.width / 2, y: size.height / 2)
                }
                
                // Draw the original two vectors.
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: mouse.point)
                }, with: .color(.gray.opacity(0.5)), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: center.point)
                }, with: .color(.gray.opacity(0.5)), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                
                // Vector subtraction!
                let sub = mouse - center
                // Draw the line to represent the result of substraction. Notice that I move the origin with translateBy(x:y:) to place the vector.
                context.translateBy(x: size.width / 2, y: size.height / 2)
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: sub.point)
                }, with: .color(.primary), style: StrokeStyle(lineWidth: 20, lineCap: .round))
            }
            // Dragging gesture that mimics the mouse location.
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.mouse = value.location.vector
                    }
            )
        }
        .navigationTitle("Vector Subtraction")
    }
}

#Preview {
    VectorSubtraction()
}
