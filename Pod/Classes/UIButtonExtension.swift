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
    public func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
    
    //  Set title text for all state
    public func textForAllState(titleText : String) {
        self.setTitle(titleText, for: .normal)
        self.setTitle(titleText, for: .selected)
        self.setTitle(titleText, for: .highlighted)
        self.setTitle(titleText, for: .disabled)
    }
    
    //  Set title text for only normal state
    public func textForNormal(titleText : String) {
        self.setTitle(titleText, for: .normal)
    }
    
    //  Set title text for only selected state
    public func textForSelected(titleText : String) {
        self.setTitle(titleText, for: .selected)
    }
    
    //  Set title text for only highlight state
    public func textForHighlighted(titleText : String) {
        self.setTitle(titleText, for: .highlighted)
    }
    
    //  Set image for all state
    public func imageForAllState(image : UIImage) {
        self.setImage(image, for: .normal)
        self.setImage(image, for: .selected)
        self.setImage(image, for: .highlighted)
        self.setImage(image, for: .disabled)
    }
    
    //  Set image for only normal state
    public func imageForNormal(image : UIImage) {
        self.setImage(image, for: .normal)
    }
    
    //  Set image for only selected state
    public func imageForSelected(image : UIImage) {
        self.setImage(image, for: .selected)
    }
    
    //  Set image for only highlighted state
    public func imageForHighlighted(image : UIImage) {
        self.setImage(image, for: .highlighted)
    }
    
    //  Set title color for all state
    public func colorOfTitleLabelForAllState(color : UIColor) {
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color, for: .selected)
        self.setTitleColor(color, for: .highlighted)
        self.setTitleColor(color, for: .disabled)
    }
    
    //  Set title color for normal state
    public func colorOfTitleLabelForNormal(color : UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    //  Set title color for selected state
    public func colorOfTitleLabelForSelected(color : UIColor) {
        self.setTitleColor(color, for: .selected)
    }
    
    //  Set title color for highkighted state
    public func colorForHighlighted(color : UIColor) {
        self.setTitleColor(color, for: .highlighted)
    }
    
    //  Set image behind the text in button
    public func setImageBehindTextWithCenterAlignment(imageWidth : CGFloat, buttonWidth : CGFloat, space : CGFloat) {
        let titleLabelWidth = self.titleLabel?.text?.stringWidth(font: self.titleLabel!.font)
        let buttonMiddlePoint = buttonWidth/2
        let fullLenght = titleLabelWidth! + space + imageWidth
        
        let imageInset = buttonMiddlePoint + fullLenght/2 - imageWidth + space
        let buttonInset = buttonMiddlePoint - fullLenght/2 - imageWidth
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageInset, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: buttonInset, bottom: 0, right: 0)
    }
    
    //  Set image behind text in left alignment
    public func setImageBehindTextWithLeftAlignment(imageWidth : CGFloat, buttonWidth : CGFloat) {
        let titleLabelWidth = self.titleLabel?.text?.stringWidth(font: self.titleLabel!.font)
        let fullLenght = titleLabelWidth! + 5 + imageWidth
        
        let imageInset = fullLenght - imageWidth + 5
        let buttonInset = CGFloat(-10.0)
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageInset, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: buttonInset, bottom: 0, right: 0)
    }
    
    //  Set image behind text in right alignment
    public func setImageOnRightAndTitleOnLeft(imageWidth : CGFloat, buttonWidth : CGFloat)  {
        let imageInset = CGFloat(buttonWidth - imageWidth - 10)
        
        let buttonInset = CGFloat(-10.0)
        
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageInset, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: buttonInset, bottom: 0, right: 0)
    }
}
