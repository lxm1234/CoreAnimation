//
//  DynamicMaskController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class DynamicMaskController: UIViewController {

    let maskLayer: CAShapeLayer = CAShapeLayer()
    let showView: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        //1、图片
        let imageView = UIImageView.init(frame: self.view.bounds)
        imageView.image = UIImage.init(named: "8")
        self.view.addSubview(imageView)
        //2、蒙版图层
        //贝塞尔曲线(创建一个圆)
        let path = UIBezierPath.init(arcCenter: CGPoint(x:0,y:0), radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        //获取path
        self.maskLayer.path = path.cgPath
        //设置填充颜色为透明
        self.maskLayer.fillColor = UIColor.blue.cgColor
        self.maskLayer.position = self.view.center
        //3、设置蒙版
        imageView.layer.mask = self.maskLayer
        //4、设置动态滑动的标准
        
        //5、添加手势
        //4、设置动态滑动的标准
        self.showView.center = self.view.center
        self.view.addSubview(self.showView)
        //5、添加手势
        let recognizer = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(handlePan:)))
        self.showView.addGestureRecognizer(recognizer)
    }
    
    @objc func handlePan(handlePan recognizer: UIPanGestureRecognizer) {
        // 拖拽
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
            // 关闭CoreAnimation实时动画绘制(核心)
            CATransaction.setDisableActions(true)
            self.maskLayer.position = view.center
        }
    }

}
