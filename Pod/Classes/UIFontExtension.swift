//
//  UIFontExtension.swift
//  SwiftExtension
//
//  Created by Dhvl Golakiya on 04/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    //  Get UIfont from fontname and font size
   public convenience init?(fontname: String , fontSize: CGFloat) {
        self.init(name:fontname, size:fontSize)
    }
}
