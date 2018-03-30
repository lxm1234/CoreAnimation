//
//  AffineTransformController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class AffineTransformController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.basicTransform()
        self.concatTransform()
    }
    
    //旋转变换
    func basicTransform() {
        let imageView = UIImageView.init(frame: CGRect.init(x: ScreenWidth/2.0 - 75, y: 100, width: 150, height: 150))
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2.0
        imageView.image = UIImage.init(named: "15")
        self.view.addSubview(imageView)
        
        let transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/2)
        imageView.layer.setAffineTransform(transform)
    }
    //混合变换
    //这里旋转和平移结合会有问题，位置有偏差
    func concatTransform(){
        let view = UIView.init(frame: CGRect.init(x: 0, y: 295, width: ScreenWidth, height: 5))
        self.view.addSubview(view)
        view.backgroundColor = UIColor.blue
        
        let imageView = UIImageView.init(frame: CGRect.init(x: ScreenWidth/2.0 - 75, y: 300, width: 200, height: 200))
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2.0
        imageView.image = UIImage.init(named: "6")
        self.view.addSubview(imageView)
        print("转换前 = \(NSStringFromCGRect(imageView.frame))")
        
        var transform = CGAffineTransform.identity
        //缩小一半
        transform = transform.scaledBy(x: 0.5, y: 0.5)
        //旋转30度
        transform = transform.rotated(by: CGFloat.pi / 180.0 * 30.0)
        //右移动100
        transform = transform.translatedBy(x: 100, y: 0)
        imageView.layer.setAffineTransform(transform)
        print("转换后 = \(NSStringFromCGRect(imageView.frame))")
    }
}
