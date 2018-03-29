//
//  ConvertPointController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ConvertPointController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //1、基准View
        let oneView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        oneView.backgroundColor = UIColor.brown
        self.view.addSubview(oneView)
        //2、添加view正常
//        let twoView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
//        twoView.backgroundColor = UIColor.blue
//        twoView.center = oneView.center
//        self.view.addSubview(twoView)
        //3、添加layer不正常
        let layerOne = CALayer()
        layerOne.backgroundColor = UIColor.red.cgColor
        layerOne.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        layerOne.position = oneView.layer.position
        oneView.layer.addSublayer(layerOne)
        print("layerOne.position = \(NSStringFromCGPoint(layerOne.position))")
        //4、更改坐标系、layer显示正常
        let layerTwo = CALayer()
        layerTwo.backgroundColor = UIColor.green.cgColor
        layerTwo.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        //这里将相对于self.view.layer的点转化为相对于oneView.layer坐标系点！！！！！
        let innerCenter = self.view.layer.convert(oneView.layer.position, to: oneView.layer)
        layerTwo.position = innerCenter
        oneView.layer.addSublayer(layerTwo)
        print("layerTwo.position = \(NSStringFromCGPoint(layerTwo.position))")
    }
}
