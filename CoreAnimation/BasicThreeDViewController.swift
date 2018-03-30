//
//  BasicThreeDViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class BasicThreeDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let imageView = UIImageView.init(frame: CGRect.init(x:120, y: 120, width: 200, height: 200))
        imageView.image = UIImage.init(named: "2")
        self.view.addSubview(imageView)
        
        var transform = CATransform3DIdentity
        //透视投影
        transform.m34 = -1.0/500
        transform = CATransform3DRotate(transform, CGFloat.pi/4, 0, 1, 0)
        imageView.layer.transform = transform
    }

}
