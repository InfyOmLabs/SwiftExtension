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
        let area = CGRectMake(0, 0, size.width, size.height)
        CGContextScaleCTM(context, 1, -1)
        CGContextTranslateCTM(context, 0, -area.size.height)
        CGContextSaveGState(context);
        CGContextClipToMask(context, area, CGImage);
        withColor.set()
        CGContextFillRect(context, area);
        CGContextRestoreGState(context);
        CGContextSetBlendMode(context, .Multiply);
        CGContextDrawImage(context, area, CGImage);
        let colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return colorizedImage;
    }
    
    //  Tinted image
    public func tintedImage() -> UIImage {
        return self.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
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
        let scaledBounds: CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        let croppedImage: UIImage = UIImage(CGImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.Up)
        return croppedImage
    }
    
    //  Rotate image with 90 degree
   public  func rotateImageToNighntyDegree() -> UIImage {
        let image =  UIImage(CGImage: self.CGImage!, scale:1, orientation: UIImageOrientation.LeftMirrored)
        return UIImage(CGImage: image.CGImage!, scale:1, orientation: UIImageOrientation.LeftMirrored)
    }
    
}