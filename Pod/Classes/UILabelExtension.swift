//
// Created by Dhvl Golakiya on 02/04/16.
// Copyright (c) 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    // Get Estimated size
    public func getEstimatedSize(width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    // Get Estimated Height
    public func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: self.getWidth, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    // Get Estimated width
    public func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.getHeight)).width
    }
    
    // Set Label Height
    public func fitHeight() {
        self.setHeight(height: getEstimatedHeight())
    }
    
    //  Set Label width
    public func fitWidth() {
        self.setWidth(width: getEstimatedWidth())
    }
    
    //  Sel Label SIze
    public func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
}
