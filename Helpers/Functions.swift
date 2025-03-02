//
//  Functions.swift
//  The Nature of Code
//
//  Created by Leonardo Larrañaga on 3/1/25.
//

import Foundation

/// Maps a floating value from one range to another.
func map<T: FloatingPoint>(_ value: T, from: ClosedRange<T>, to: ClosedRange<T>) -> T {
    let fromDiff = from.upperBound - from.lowerBound
    let toDiff = to.upperBound - to.lowerBound
    return (value - from.lowerBound) * toDiff / fromDiff + to.lowerBound
}

/// Maps an integer value from one range to another.
func map(_ value: Int, from: ClosedRange<Int>, to: ClosedRange<Int>) -> Int {
    Int(map(Double(value), from: Double(from.lowerBound)...Double(from.upperBound), to: Double(to.lowerBound)...Double(to.upperBound)))
}
