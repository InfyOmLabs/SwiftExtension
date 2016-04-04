//
// Created by Dhvl Golakiya on 02/04/16.
// Copyright (c) 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation

extension Array {

    //  Make Comma separated String from array
    public var toCommaString: String! {
        let stringArray = self as? NSArray
        if let stringArray = stringArray {
            return stringArray.componentsJoinedByString(",")
        }
        return ""
    }

    // Remove Specific object from Array
   public  mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }

        if(index != nil) {
            self.removeAtIndex(index!)
        }
    }

    //  Chack Array contain specific object
    public func containsObject<T:AnyObject>(item:T) -> Bool
    {
        for element in self
        {
            if item === element as? T
            {
                return true
            }
        }
        return false
    }

    //  Get Index of specific object
    public func indexOfObject<T : Equatable>(x:T) -> Int? {
        for i in 0...self.count {
            if self[i] as! T == x {
                return i
            }
        }
        return nil
    }

    //  Gets the object at the specified index, if it exists.
    public func get(index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
}