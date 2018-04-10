//
//  CircleView.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var arcRadius: CGFloat!
    let StartAngle: CGFloat = -90
    let EndAngle: CGFloat = 270
    var progress: CGFloat = 0 {
        didSet{
            CATransaction.begin()
            CATransaction.setDisableActions(false)
            CATransaction.setAnimationDuration(1.5)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn))
            self.trackLayer.strokeEnd = progress
            var newCenter = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/2)
            newCenter.y += self.arcRadius * sin(CGFloat.pi/180*(360*progress - 90))
            newCenter.x += self.arcRadius * cos(CGFloat.pi/180*(360*progress - 90))
            self.endPointView.center = newCenter
            CATransaction.commit()
        }
    }
    
    lazy var backgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineCap = kCALineCapRound
        layer.lineJoin = kCALineJoinRound
        layer.lineWidth = 5.0
        return layer
    }()
    
    lazy var trackLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 5.0
        return layer
    }()
    
    lazy var endPointView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: self.frame.size.width/2.0, y: 0, width: 20, height: 20))
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 10.0
        view.layer.masksToBounds = true
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.arcRadius = self.frame.size.width / 2.0 > self.frame.size.height / 2.0 ? self.frame.size.height / 2.0 : self.frame.size.width / 2.0
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews() {
        let backgroundPath = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0), radius: self.frame.size.width/2.0, startAngle: StartAngle, endAngle: EndAngle, clockwise: true)
        self.backgroundLayer.path = backgroundPath.cgPath
        
        let trackPath = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.width/2.0, startAngle: CGFloat.pi * StartAngle/180, endAngle: CGFloat.pi * EndAngle/180, clockwise: true)
        self.trackLayer.path = trackPath.cgPath
        self.trackLayer.strokeEnd = 0.0
        
        self.layer.addSublayer(self.backgroundLayer)
        self.layer.addSublayer(self.trackLayer)
        self.addSubview(endPointView)
    }
}
