//
//  subLayerTransformController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class subLayerTransformController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var oneImageView: UIImageView!
    @IBOutlet weak var twoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0/500
        self.containerView.layer.sublayerTransform = perspective
        //1、逆时针旋转45度
        let transform1 = CATransform3DMakeRotation(CGFloat.pi/4, 0, 1, 0)
        self.oneImageView.layer.transform = transform1
        self.oneImageView.layer.isDoubleSided = false
        //2、顺时针旋转45度
        let transform2 = CATransform3DMakeRotation(-CGFloat.pi/4, 0, 1, 0)
        self.twoImageView.layer.transform = transform2
        self.twoImageView.layer.isDoubleSided = false
    }
}
