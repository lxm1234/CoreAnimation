//
//  HWButton.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class HWButton: UIButton {
    
    var minimumHitTestWidth: CGFloat = 0
    var minimumHitTestHeight: CGFloat = 0
    
    var hitTestEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero
    
    /**
     * 第二种方法
     */
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsets.zero) || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }

        let relativeFrame = self.bounds
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets)

        return hitFrame.contains(point)
    }
    
    /**
     * 第一种方法
     */
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        return hitTestBounds(bounds: self.bounds).contains(point)
//    }
//
//    func hitTestBounds(bounds: CGRect) -> CGRect{
//        var hitTestingBounds = bounds
//        if minimumHitTestWidth > bounds.size.width {
//            hitTestingBounds.size.width = minimumHitTestWidth
//            hitTestingBounds.origin.x -= (hitTestingBounds.size.width - bounds.size.width)/2
//        }
//
//        if minimumHitTestHeight > bounds.size.height {
//            hitTestingBounds.size.height = minimumHitTestHeight
//            hitTestingBounds.origin.y -= (hitTestingBounds.size.height - bounds.size.height)/2
//        }
//        return hitTestingBounds
//
//    }
}
