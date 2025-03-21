//
//  File.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/6/25.
//

import Foundation
import simd

extension SIMD2 where Scalar == Double {
    /// Creates a CGPoint from a SIMD2<Double>.
    var point: CGPoint {
        CGPoint(x: self.x, y: self.y)
    }
    
    /// Limits the magnitude of the vector to a maximum value.
    mutating func limit(to max: Double) {
        if length(self) > max {
            self = normalize(self)
            self *= max
        }
    }
    
    /// Returns a unit vector pointing in a random direction.
    static func normalizedRandom() -> SIMD2<Double> {
        let angle = Double.random(in: 0...(2 * .pi))
        return SIMD2(x: cos(angle), y: sin(angle))
    }
}

extension CGPoint {
    /// Creates a SIMD2<Double> from a CGPoint.
    var vector: SIMD2<Double> {
        SIMD2(x: Double(self.x), y: Double(self.y))
    }
}
