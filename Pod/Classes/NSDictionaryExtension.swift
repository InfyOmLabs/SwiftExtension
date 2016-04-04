//
//  NSDictionaryExtension.swift
//  SwiftExtension
//
//  Created by Dhvl Golakiya on 04/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension NSDictionary {
    
    //  Convert NSDictionary to NSData
    public var toNSData : NSData! {
        do {
            return try NSJSONSerialization.dataWithJSONObject(self, options: .PrettyPrinted)          // success ...
        } catch {
            // failure
            print("Fetch failed: \((error as NSError).localizedDescription)")
        }
        return NSData()
    }
    
    //  Check key is exist in NSDictionary or not
    public func has(key: Key) -> Bool {
        return objectForKey(key) != nil
    }

}