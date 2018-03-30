//
//  HitScrollView.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class HitScrollView: UIView {
    
    @IBOutlet weak var scrollerView: UIScrollView!
    
    var dataArray: [String] {
        var data:[String] = []
        for i in 0..<18 {
            data.append("\(i+1)")
        }
        return data
    }
    
    override func awakeFromNib() {
        self.scrollerView.contentInsetAdjustmentBehavior = .never
        let width = self.scrollerView.frame.size.width
        let height = self.scrollerView.frame.size.height
        for i in 0..<self.dataArray.count {
            let imageView = UIImageView(frame:CGRect(x:width * CGFloat(i),y:0,width: width,height:height))
            imageView.image = UIImage.init(named: dataArray[i])
            self.scrollerView.addSubview(imageView)
        }
        self.scrollerView.contentSize = CGSize.init(width: width * CGFloat(self.dataArray.count), height: height)
        self.scrollerView.clipsToBounds = true
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var hitTestView = super.hitTest(point, with: event)
        if hitTestView != nil {
            hitTestView = self.scrollerView
        }
        return hitTestView
    }
}
