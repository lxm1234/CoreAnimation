//
//  HitTestView.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class HitTestView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01 {
            return nil
        }
        for subView in self.subviews.reversed() {
            let convertedPoint = subView.convert(point, from: self)
            let hitTestView = subView.hitTest(convertedPoint, with: event)
            if hitTestView != nil {
                return hitTestView
            }
        }
        return self
    }
}
