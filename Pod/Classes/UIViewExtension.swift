//
// Created by Dhvl Golakiya on 02/04/16.
// Copyright (c) 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //  Get End X point of view
    public var endX : CGFloat {
        return frame.origin.x + frame.width
    }
    
    //  Get End Y point of view
    public var endY : CGFloat {
        return frame.origin.y + frame.height
    }
    
    //  Get Origin.x
    public var startX : CGFloat {
        return frame.origin.x
    }
    
    //  Get Origin.y
    public var startY : CGFloat {
        return frame.origin.y
    }
    
    //  Get width of View
    public var getWidth : CGFloat {
        return frame.width
    }
    
    //  Get height of view
    public var getHeight : CGFloat {
        return frame.height
    }
    
    //  Set Origin.x
    public func setStartX(x : CGFloat) {
        self.frame.origin.x = x
    }
    
    //  Set Origin.y
    public func setStartY( y : CGFloat) {
        self.frame.origin.y = y
    }
    
    //  Set view width
    public func setWidth(width : CGFloat) {
        self.frame.size = CGSizeMake(width, self.getHeight)
    }
    
    //  Set view height
    public func setHeight( height : CGFloat) {
        self.frame.size = CGSizeMake(self.getWidth, height)
    }
    
    //  Set Center
    public func setCenter(x : CGFloat, y : CGFloat) {
        self.center = CGPoint(x : x,y: y)
    }
    
    //  Get center
    public func getCenter() -> CGPoint {
        return self.center
    }
    
    // Set center.x
    public func setCenterX(x: CGFloat) {
        self.center = CGPoint(x: x, y: self.getCenterY())
    }
    
    //  Get center.x
    public func getCenterX() -> CGFloat {
        return self.center.x
    }
    
    //  Set center.y
    public func setCenterY(y : CGFloat)  {
        self.center = CGPoint(x : self.getCenterX(), y : y)
    }
    
    //  Get center.y
    public func getCenterY() -> CGFloat {
        return self.center.y
    }
    
    //  Get Parent View controller
    public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController!
            }
        }
        return nil
    }
    
    //  Apply plain shadow to view
    public func applyPlainShadow() {
        let layer = self.layer
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSizeMake(0, 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1.0
    }
    
    //  Apply boarder to view
    public func applyBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.grayColor().CGColor
    }
    
    //  Apply corner radius
    public func applyCornerRadius(corenrRadius : CGFloat , mask : Bool) {
        self.layer.masksToBounds = mask
        self.layer.cornerRadius = corenrRadius
    }
    
    //  Add only bottom border
    public func applyBottomBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.grayColor().CGColor
    }
    
    //  Add Top Border
    public func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(0, 0, self.getWidth, width)
        self.layer.addSublayer(border)
    }
    
    //  Add Right Border
    public func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(self.getWidth - width, 0, width, self.getHeight)
        self.layer.addSublayer(border)
    }
    
    //  Add Bottom Border
    public func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(0, self.getHeight - width, self.getWidth, width)
        self.layer.addSublayer(border)
    }
    
    //  Add Left Border
    public func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(0, 0, width, self.getHeight)
        self.layer.addSublayer(border)
    }
}