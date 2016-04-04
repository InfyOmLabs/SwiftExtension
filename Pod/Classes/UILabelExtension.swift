//
// Created by Dhvl Golakiya on 02/04/16.
// Copyright (c) 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    // Get Estimated size
    public func getEstimatedSize(width: CGFloat = CGFloat.max, height: CGFloat = CGFloat.max) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    // Get Estimated Height
    public func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: self.getWidth, height: CGFloat.max)).height
    }
    
    // Get Estimated width
    public func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.max, height: self.getHeight)).width
    }
    
    // Set Label Height
    public func fitHeight() {
        self.setHeight(getEstimatedHeight())
    }
    
    //  Set Label width
    public func fitWidth() {
        self.setWidth(getEstimatedWidth())
    }
    
    //  Sel Label SIze
    public func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
    
    //  Get line text in Array of String
   public func getLinesArrayOfString() -> [String] {
        
        let text:NSString = self.text!
        let font:UIFont = self.font
        let rect:CGRect = self.frame
        self.lineBreakMode = .ByWordWrapping
        let myFont:CTFontRef = CTFontCreateWithName(font.fontName, font.pointSize, nil)
        let attStr:NSMutableAttributedString = NSMutableAttributedString(string: text as String)
        attStr.addAttribute(String(kCTFontAttributeName), value:myFont, range: NSMakeRange(0, attStr.length))
        let frameSetter:CTFramesetterRef = CTFramesetterCreateWithAttributedString(attStr as CFAttributedStringRef)
        let path:CGMutablePathRef = CGPathCreateMutable()
        CGPathAddRect(path, nil, CGRectMake(0, 0, rect.size.width, 100000))
        let frame:CTFrameRef = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        let lines = CTFrameGetLines(frame) as NSArray
        var linesArray = [String]()
        
        for line in lines {
            let lineRange = CTLineGetStringRange(line as! CTLine)
            let range:NSRange = NSMakeRange(lineRange.location, lineRange.length)
            let lineString = text.substringWithRange(range)
            linesArray.append(lineString as String)
        }
        return linesArray
    }
    
    //  Get specif line text
    public func getLinesArrayOfString(lineNumber : Int) -> String {
        let lines = self.getLinesArrayOfString()
        if lineNumber <= lines.count {
            return lines[lineNumber]
        }
        return ""
    }
}