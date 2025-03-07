//
//  1.5 - Vector Magnitude.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import SwiftUI
import simd

struct VectorMagnitude: View {
    
    @State var mouse = SIMD2(x: 0.0, y: 0.0)
    
    var body: some View {
        VStack {
            Text("Drag to simulate the mouse location.")
                .foregroundStyle(.secondary)
            
            Canvas { context, size in
                let center = SIMD2(x: size.width / 2, y: size.height / 2)
                let sub = mouse - center
                // The magnitude (that is, length) of a vector can be accessed via the length function from simd.
                // Here it is used as the width of a rectangle drawn at the top of the window.
                let magnitude = length(sub)
                context.fill(Path(CGRect(x: 0, y: 0, width: magnitude, height: 20)), with: .color(.primary))
                
                context.translateBy(x: size.width / 2, y: size.height / 2)
                context.stroke(Path { path in
                    path.move(to: .zero)
                    path.addLine(to: sub.point)
                }, with: .color(.primary), style: StrokeStyle(lineWidth: 5, lineCap: .round))
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.mouse = value.location.vector
                    }
            )
        }
        .navigationTitle("Vector Magnitude")
    }
}

#Preview {
    VectorMagnitude()
}
