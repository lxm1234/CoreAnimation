//
//  UIButton + ExpandArea.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

extension UIButton {
    
    private struct HitTestEdge {
        static var KEY_HIT_TEST_EDGE_INSETS = "HitTestEdgeInsets"
    }
    
    var hit1TestEdgeInsets: UIEdgeInsets {
        set {
            objc_setAssociatedObject(self, &HitTestEdge.KEY_HIT_TEST_EDGE_INSETS, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let hitEdgeInsert = objc_getAssociatedObject(self, &HitTestEdge.KEY_HIT_TEST_EDGE_INSETS) as? UIEdgeInsets  {
                return hitEdgeInsert
            } else {
                return UIEdgeInsets.zero
            }
        }
    }
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        if UIEdgeInsetsEqualToEdgeInsets(self.hit1TestEdgeInsets, UIEdgeInsets.zero) || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }
        
        let relativeFrame = self.bounds
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hit1TestEdgeInsets)
        
        return hitFrame.contains(point)
    }
}
