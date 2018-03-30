//
//  DynamicMaskImprovedController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class DynamicMaskImprovedController: UIViewController {

    var imageView: UIImageView?
    var maskLayer: CAShapeLayer?
    let showView: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
        //1、图片
        let imageView = UIImageView(image: UIImage(named: "7"))
        self.imageView = imageView
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        //2、蒙版图层
        self.maskLayer = CAShapeLayer()
        //贝塞尔曲线(创建一个圆)
          let path = UIBezierPath.init(arcCenter: CGPoint(x:0,y:0), radius: 50, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        //获取path
        self.maskLayer!.path = path.cgPath
        //设置填充颜色为透明
        self.maskLayer!.fillColor = UIColor.green.cgColor
        //这里需要坐标转换以一下
        let maskCenter = self.view.convert(self.view.center, to: imageView)
        //这样做显示不出来、如果imageView大小与self.view大小一致，可以显示。
        //self.maskLayer.position = self.view.center;
        self.maskLayer!.position = maskCenter;
        
        //3、设置蒙版
        imageView.layer.mask = self.maskLayer;
        
        //4、设置动态滑动的标准
        self.showView.backgroundColor = UIColor.clear
        self.showView.center = self.view.center
        self.view.addSubview(self.showView)
        //5、添加手势
        let recognizer = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan(handlePan:)))
        self.showView.addGestureRecognizer(recognizer)
    }
    
    @objc func handlePan(handlePan recognizer: UIPanGestureRecognizer) {
        //1、手势在self.view坐标系中移动的位置
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            var newCenter = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            //2、限制屏幕范围：
            newCenter.y = max(self.imageView!.frame.origin.y, newCenter.y)
            newCenter.y = min(self.imageView!.frame.maxY, newCenter.y)
            newCenter.x = max(self.imageView!.frame.origin.x, newCenter.x)
            newCenter.x = min(self.imageView!.frame.maxX, newCenter.x)
            //设置中心点范围
            view.center = newCenter
            //3、将手势坐标点归0、否则会累加
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            //4、关闭CoreAnimation实时动画绘制(核心)
            CATransaction.setDisableActions(true)
            //5、设置中心点范围
            view.center = newCenter;
            //6、设置蒙版的中心点
            //这个需要转换坐标系
            let maskCenter = self.view.convert(newCenter, to: self.imageView)
            self.maskLayer!.position = maskCenter
        }
    }
}
