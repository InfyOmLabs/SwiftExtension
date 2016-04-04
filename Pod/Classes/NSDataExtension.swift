//
//  NSDataExtension.swift
//  SwiftExtension
//
//  Created by Dhvl Golakiya on 04/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension NSData {
    //  Convert NSData to NSDictionary
    public var toDictionary : NSDictionary! {
        let JSONData = self
        do {
            let JSON = try NSJSONSerialization.JSONObjectWithData(JSONData, options:NSJSONReadingOptions(rawValue: 0))
            guard let dictioonary :NSDictionary = JSON as? NSDictionary else {
                print("Not a Dictionary")
                // put in function
                return nil
            }
            return dictioonary
        }
        catch let JSONError as NSError {
            print("\(JSONError)")
        }
        return nil
    }
    
    //  Convert NSData to String
    public var toJsonString : NSString! {
        return NSString(data: self, encoding: NSUTF8StringEncoding) as String?
    }
}

extension NSMutableData {
    
    //  Append String data to NSData
    public func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
}