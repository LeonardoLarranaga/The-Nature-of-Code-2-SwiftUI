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
    
    mutating func limit(to max: Double) {
        if length(self) > max {
            self = normalize(self)
            self *= max
        }
    }
}

extension CGPoint {
    /// Creates a SIMD2<Double> from a CGPoint.
    var vector: SIMD2<Double> {
        SIMD2(x: Double(self.x), y: Double(self.y))
    }
}
