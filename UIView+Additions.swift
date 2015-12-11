//
//  UIView+Additions.swift
//  iBBS
//
//  Created by Augus on 9/4/15.
//
//  http://iAugus.com
//  https://github.com/iAugux
//
//  Copyright © 2015 iAugus. All rights reserved.
//

import UIKit

extension UIView {
    func setFrameSize(size: CGSize) {
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }
    
    func setFrameHeight(height: CGFloat) {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func setFrameWidth(width: CGFloat) {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
    }

    func setFrameOriginX(originX: CGFloat) {
        var frame = self.frame
        frame.origin.x = originX
        self.frame = frame
    }
    
    func setFrameOriginY(originY: CGFloat) {
        var frame = self.frame
        frame.origin.y = originY
        self.frame = frame
    }

    /**
     set current view's absolute center to other view's center
     
     - parameter view: other view
     */
    func centerTo(view view: UIView) {
        self.frame.origin.x = view.bounds.midX - self.frame.width / 2
        self.frame.origin.y = view.bounds.midY - self.frame.height / 2
        
    }
}
