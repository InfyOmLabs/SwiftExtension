//
//  UIImageExtension.swift
//  SwiftExtension
//
//  Created by Dhvl Golakiya on 04/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    //  Get IMage with background color
    public func colorizeImage(withColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        let area = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: area.size.height * -1)
        context?.saveGState()
        context?.clip(to: area, mask: self.cgImage!)
        withColor.set()
        context?.fill(area)
        context?.restoreGState()
        context?.setBlendMode(.multiply)
        context?.draw(self.cgImage!, in: area)
        let colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return colorizedImage!
    }
    
    //  Tinted image
    public func tintedImage() -> UIImage {
        return self.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
    }
    
    //  Crop image
    public  func croppedImage(bound: CGRect) -> UIImage? {
        guard self.size.width > bound.origin.x else {
            print("Your cropping bound X coordinate is larger than the image width")
            return nil
        }
        guard self.size.height > bound.origin.y else {
            print("Your cropping bound Y coordinate is larger than the image height")
            return nil
        }
        let scaledBounds: CGRect = CGRect(x: bound.origin.x * self.scale, y: bound.origin.y * self.scale, width: bound.size.width * self.scale, height: bound.size.height * self.scale)
        let imageRef = self.cgImage?.cropping(to: scaledBounds)
        let croppedImage: UIImage = UIImage(cgImage: imageRef!, scale: self.scale, orientation: UIImage.Orientation.up)
        return croppedImage
    }
    
    //  Rotate image with 90 degree
    public  func rotateImageToNighntyDegree() -> UIImage {
        let image =  UIImage(cgImage: self.cgImage!, scale:1, orientation: UIImage.Orientation.leftMirrored)
        return UIImage(cgImage: image.cgImage!, scale:1, orientation: UIImage.Orientation.leftMirrored)
    }
    
}
