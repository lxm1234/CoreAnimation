//
//  InAndOutViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class InAndOutViewController: UIViewController {

    var innerView: UIView?
    var outView: UIView?
    var innerViewT: UIView?
    var outViewT: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        innerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        innerView?.backgroundColor = UIColor.brown
        
        outView = UIView(frame: CGRect(x: 150, y: 100, width: 150, height: 150))
        outView?.backgroundColor = UIColor.green
        
        innerViewT = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        innerViewT?.backgroundColor = UIColor.blue
        
        outViewT = UIView(frame: CGRect(x: 150, y: 400, width: 150, height: 150))
        outViewT?.backgroundColor = UIColor.brown
        self.addRotateZ()
        self.addRotateY()
        
    }
    
    func addRotateZ() {
        self.view.addSubview(self.outView!)
        self.outView!.addSubview(self.innerView!)
        self.innerView?.center = CGPoint.init(x: self.outView!.frame.size.width/2, y: self.outView!.frame.size.height/2)
        
        //外部旋转正45度
        let outer = CATransform3DMakeRotation(CGFloat.pi/4, 0, 1, 0)
        self.outView!.layer.transform = outer
        //内部旋转负45度
        let inner = CATransform3DMakeRotation(-CGFloat.pi/4, 0, 1, 0)
        self.innerView!.layer.transform = inner;
    }
    
    //这里没有达到预期的效果、需要CATransformLayer来协调
    func addRotateY() {
        self.view.addSubview(self.outViewT!)
        self.outViewT!.addSubview(self.innerViewT!)
        self.innerViewT?.center = CGPoint.init(x: self.outViewT!.frame.size.width/2, y: self.outViewT!.frame.size.height/2)
        //外部旋转正45度
        var outer = CATransform3DIdentity;
        outer.m34 = -1.0 / 500.0;
        outer = CATransform3DRotate(outer, CGFloat.pi/4, 0, 1, 0);
        self.outViewT!.layer.transform = outer
        
        //内部旋转负45度
        var inner = CATransform3DIdentity;
        inner.m34 = -1.0 / 500.0;
        inner = CATransform3DRotate(inner, -CGFloat.pi/4, 0, 1, 0);
        
        self.innerViewT!.layer.transform = inner;
    }
}
