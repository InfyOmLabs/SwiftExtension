//
//  UIButtonExtension.swift
//  SwiftExtension
//
//  Created by Dhvl Golakiya on 04/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    //  Apply corner radius
    public func applyCornerRadius(mask : Bool) {
        self.layer.masksToBounds = mask
        self.layer.cornerRadius = self.frame.size.width/2
    }
    
    //  Set background color for state
    public func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), color.CGColor)
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, forState: forState)
    }
    
    //  Set title text for all state
    public func textForAllState(titleText : String) {
        self.setTitle(titleText, forState: .Normal)
        self.setTitle(titleText, forState: .Selected)
        self.setTitle(titleText, forState: .Highlighted)
        self.setTitle(titleText, forState: .Disabled)
    }
    
    //  Set title text for only normal state
    public func textForNormal(titleText : String) {
        self.setTitle(titleText, forState: .Normal)
    }
    
    //  Set title text for only selected state
    public func textForSelected(titleText : String) {
        self.setTitle(titleText, forState: .Selected)
    }
    
    //  Set title text for only highlight state
    public func textForHighlighted(titleText : String) {
        self.setTitle(titleText, forState: .Highlighted)
    }
    
    //  Set image for all state
    public func imageForAllState(image : UIImage) {
        self.setImage(image, forState: .Normal)
        self.setImage(image, forState: .Selected)
        self.setImage(image, forState: .Highlighted)
        self.setImage(image, forState: .Disabled)
    }
    
    //  Set image for only normal state
    public func imageForNormal(image : UIImage) {
        self.setImage(image, forState: .Normal)
    }
    
    //  Set image for only selected state
    public func imageForSelected(image : UIImage) {
        self.setImage(image, forState: .Selected)
    }
    
    //  Set image for only highlighted state
    public func imageForHighlighted(image : UIImage) {
        self.setImage(image, forState: .Highlighted)
    }
    
    //  Set title color for all state
    public func colorOfTitleLabelForAllState(color : UIColor) {
        self.setTitleColor(color, forState: .Normal)
        self.setTitleColor(color, forState: .Selected)
        self.setTitleColor(color, forState: .Highlighted)
        self.setTitleColor(color, forState: .Disabled)
    }
    
    //  Set title color for normal state
    public func colorOfTitleLabelForNormal(color : UIColor) {
        self.setTitleColor(color, forState: .Normal)
    }
    
    //  Set title color for selected state
    public func colorOfTitleLabelForSelected(color : UIColor) {
        self.setTitleColor(color, forState: .Selected)
    }
    
    //  Set title color for highkighted state
    public func colorForHighlighted(color : UIColor) {
        self.setTitleColor(color, forState: .Highlighted)
    }
    
    //  Set image behind the text in button
    public func setImageBehindTextWithCenterAlignment(imageWidth : CGFloat, buttonWidth : CGFloat, space : CGFloat) {
        let titleLabelWidth = self.titleLabel?.text?.stringWidth(self.titleLabel!.font)
        let buttonMiddlePoint = buttonWidth/2
        let fullLenght = titleLabelWidth! + space + imageWidth
        
        let imageInset = buttonMiddlePoint + fullLenght/2 - imageWidth + space
        let buttonInset = buttonMiddlePoint - fullLenght/2 - imageWidth
        
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imageInset, 0, 0)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, buttonInset, 0, 0)
    }
    
    //  Set image behind text in left alignment
    public func setImageBehindTextWithLeftAlignment(imageWidth : CGFloat, buttonWidth : CGFloat) {
        let titleLabelWidth = self.titleLabel?.text?.stringWidth(self.titleLabel!.font)
        let fullLenght = titleLabelWidth! + 5 + imageWidth
        
        let imageInset = fullLenght - imageWidth + 5
        let buttonInset = CGFloat(-10.0)
        
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imageInset, 0, 0)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, buttonInset, 0, 0)
    }
    
    //  Set image behind text in right alignment
    public func setImageOnRightAndTitleOnLeft(imageWidth : CGFloat, buttonWidth : CGFloat)  {
        let imageInset = CGFloat(buttonWidth - imageWidth - 10)
        
        let buttonInset = CGFloat(-10.0)
        
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imageInset, 0, 0)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, buttonInset, 0, 0)
    }
}