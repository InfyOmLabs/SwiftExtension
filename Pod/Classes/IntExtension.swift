//
//  IntExtension.swift
//  SwiftExtension
//
//  Created by Mitul Golakiya on 01/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension Int {

    //  Check is even
    public var isEven: Bool {
        return self % 2 == 0
    }

    //  Check is odd
    public var isOdd: Bool {
        return !self.isEven
    }

    //  Check is Positive
    public var isPositive: Bool {
        return self >= 0
    }

    //  Check is Negative
    public var isNegative: Bool {
        return !self.isPositive
    }

    //  Get Digit
    public func digit() -> [Int] {
        return description.characters.map{Int(String($0)) ?? 0}
    }

    //  Get Digit count
    public var digitCount: Int {
        return self.digit().count
    }

    //  Convert to Float
    public var toFloat: Float {
        return Float(self)
    }

    //  Convert to CGFloat
    public var toCGFloat: CGFloat {
        return CGFloat(self)
    }

    //  Convert to String
    public var toString: String {
        return String(self)
    }

    //  Convert to Int64
    public var toInt64: Int64 {
        return Int64(self)
    }

    //  Convert to Double
    public var toDouble : Double {
        return Double(self)
    }

    //  Convert to UInt
    public var toUInt : UInt {
        return UInt(self)
    }

    //   Return Factorial
    public func factorial() -> Int {
        return self == 0 ? 1 : self * (self - 1).factorial()
    }

}

extension UInt {
    //  Convert UInt to Int
     public var toInt: Int {
         return Int(self)
     }
}
