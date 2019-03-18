//
//  SwiftExtension.swift
//  SwiftExtension
//
//  Created by Mitul Golakiya on 01/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    //  Trim String with white spaces
    public func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    //  Trim String with new line character
    public func trimForNewLineCharacterSet() -> String {
        return self.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    //  Trim String for phone number string
    public func trimPhoneNumberString() -> String {
        return self.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: self.startIndex..<self.endIndex)
    }
    
    // String length
    public var length: Int {
        return self.count
    }
    
    //  NSDate from String
    public func getDate() -> Date {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd"
        return dateFormate.date(from: self)!
    }
    
    //  NSDate with time from String
    public func getDateAndTime() -> Date {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormate.date(from: self)!
    }
    
    //  Make array from string with comma (,)
    public var makeArray : Array<Any> {
        return self.components(separatedBy: ",")
    }
    
    //  Make array from string with white space ( )
    public var makeArrayByWhiteSpace : Array<Any> {
        return self.components(separatedBy: " ")
    }
    
    //  Get nth character
    public subscript(integerIndex: Int) -> Character {
        return self[index(startIndex, offsetBy: integerIndex)]
    }
    
    //  Get sub string with range
    public subscript(integerRange: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: integerRange.startIndex)
        let end = index(startIndex, offsetBy: integerRange.endIndex) 
        let range = start..<end
        return String(self[range])
    }
    
    //  Convert String to NSDictionary
    public var toDictionary : [String: Any]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    
    /***
     Get String size
     :param: font
     :param: width
     :param: lineSpecing
     :returns: Size of this string using these parameters
     */
    public func stringSizeWith(font: UIFont,width:CGFloat, lineSpecing : CGFloat)->CGRect
    {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        if lineSpecing > 0 {
            paragraphStyle.lineSpacing = lineSpecing
        }
        paragraphStyle.lineBreakMode = .byWordWrapping;
        let  attributes = [NSAttributedString.Key.font:font,
                           NSAttributedString.Key.paragraphStyle:paragraphStyle.copy()]
        
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect
    }
    
    /**
     Get String Width
     :param: font
     :returns: Width of this string using given font
     */
    public func stringWidth(font: UIFont) -> CGFloat {
        let  attributes = [NSAttributedString.Key.font:font]
        let text = self as NSString
        let size = text.size(withAttributes: attributes)
        return size.width
    }
    
    /**
     Remove character
     :param: count
     :returns: String with removed characters
     */
    public func removeCharsFromEnd(count_:Int) -> String {
        let start = index(startIndex, offsetBy: 0)
        let stringLength = self.count
        let substringIndex = (stringLength < count_) ? 0 : stringLength - count_
        let end = index(startIndex, offsetBy: substringIndex)
        let range = start..<end
        return String(self[range])
    }
    
    //  Matches Regex in String
    public func matchesForRegexInText(regex: String!) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = self as NSString
            let results = regex.matches(in: self,
                                        options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    //  Get Youtube video Id from String
    public func getYoutubeID() -> String {
        let pattern: String = "(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)"
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            if let regexMatch = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange(location: 0, length: self.utf16.count)) {
                return (self as NSString).substring(with: regexMatch.range)
            }
        } catch {
            // failure
            return ""
        }
        return ""
    }
    
    //  Convert String to Double Value
    public func toDouble() -> Double? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.doubleValue
        } else {
            return nil
        }
    }
    
    //  Convert String to Float Value
    public func toFloat() -> Float? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.floatValue
        } else {
            return nil
        }
    }
    
    //   Convert String to UInt Value
    public func toUInt() -> UInt? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.uintValue
        } else {
            return nil
        }
    }
    
    //  Convert String to Bool Value
    public func toBool() -> Bool? {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.boolValue
        } else {
            return nil
        }
    }
    
    //  Check for email validation
    public var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //  Check for URL validation
    public var isValideUrl : Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        return predicate.evaluate(with: self)
    }
    
    //  Convert to NSData
    public func toNSData() -> Data {
        return self.data(using: String.Encoding.utf8, allowLossyConversion: true)!
    }
    
    //  Check for Substring with case sensitive
    public func contains(other: String) -> Bool{
        return self.contains(other)
    }
    
    //  Check for Substring with ignoring case sensitive
    public func containsIgnoreCase(other: String) -> Bool{
        return self.lowercased().contains(other.lowercased())
    }
    
    //  Get last path component
    public var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent
        }
    }
    
    //  Get path Extenction
    public var pathExtension: String {
        get {
            return (self as NSString).pathExtension
        }
    }
    
    //  Delete last path component
    public var stringByDeletingLastPathComponent: String {
        get {
            return (self as NSString).deletingLastPathComponent
        }
    }
    
    //  Delete path extension
    public var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).deletingPathExtension
        }
    }
    
    //  Get all path component
    public var pathComponents: [String] {
        get {
            return (self as NSString).pathComponents
        }
    }
    
    //  Add path component
    public func stringByAppendingPathComponent(path: String) -> String {
        let mainString = self as NSString
        return mainString.appendingPathComponent(path)
    }
    
    //  Add path extension
    public func stringByAppendingPathExtension(ext: String) -> String? {
        let mainString = self as NSString
        return mainString.appendingPathExtension(ext)
    }
    
    /**
     Inserts a substring at the given index in self.
     :param: index Where the new string is inserted
     :param: string String to insert
     :returns: String formed from self inserting string at index
     */
    public func insertSubString (index: Int, _ string: String) -> String {
        if index > length {
            return self + string
        } else if index < 0 {
            return string + self
        }
        
        return self[0..<index] + string + self[index..<length]
    }
}

public extension NSAttributedString {
    //  Get string width
    public func stringSizeWith(width:CGFloat)->CGRect
    {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let options : NSStringDrawingOptions = [.usesLineFragmentOrigin , .usesFontLeading ]
        let text = self as NSAttributedString
        let rect = text.boundingRect(with: size, options: options , context:nil)
        return rect
    }
}
