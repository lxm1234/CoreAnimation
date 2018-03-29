//
//  HitTestingController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class HitTestingController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    var blueLayer:CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.blueLayer = CALayer()
        self.blueLayer?.frame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        self.blueLayer?.backgroundColor = UIColor.blue.cgColor
        self.layerView.layer.addSublayer(self.blueLayer!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1、普通方法
        //self.commonMethodWithTouches(touches, with: event)
        //2、HitTest方法
        self.hitTestWithTouches(touches, with: event)
    }
    
    func commonMethodWithTouches(_ touches: Set<UITouch>, with event: UIEvent?)  {
        //1、get touch position relative to main view
        //这个point是基于self.view的坐标系
        var point = (touches.first?.location(in: self.view))!
        print("self.view = \(point)")
        //2、convert point to the white layer's coordinates
        //将point转化为self.layerView.layer的坐标系中
        let tempPoint = point
        point = self.layerView.layer.convert(point, from: self.view.layer)
        //与上述方法一样，达到坐标转化效果
        let tempOnePoint = self.view.layer.convert(tempPoint, to: self.layerView.layer)
        print("self.layerView.layer = \(point)")
        print("tempOnePoint = \(tempOnePoint)")
        //3、get layer using containsPoint:
        //判断point是否包含在layer范围内
        if self.layerView.layer.contains(point) {
            //4、convert point to blueLayer’s coordinates
            //将point转化到blueLayer的坐标系中
            let tempPoint = point
            point = (self.blueLayer?.convert(point, from: self.layerView.layer))!
            //与上述方法一样，达到坐标转化效果
            let tempTwoPoint = self.layerView.layer.convert(tempPoint, to: self.blueLayer)
            print("self.blueLayer = \(point)")
            print("tempTwoPoint = \(tempTwoPoint)")
            if (self.blueLayer?.contains(point))! {
                let alertView = UIAlertController.init(title: "Inside Blue Layer", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alertView.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { (_) in
                    print("点击蓝色成功")
                }))
                self.present(alertView, animated: true, completion: nil)
            } else {
                let alertView = UIAlertController.init(title: "Inside White Layer", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alertView.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { (_) in
                    print("点击白色成功")
                }))
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    func hitTestWithTouches(_ touches: Set<UITouch>, with event: UIEvent?)  {
        //1、get touch position
        //获取当前self.view中的坐标系点击point
        let point = (touches.first?.location(in: self.view))!
        
        //2、get touched layer
        //获取当前点击layer、利用hitTest
        let layer = self.layerView.layer.hitTest(point)
        if layer == self.blueLayer {
            let alertView = UIAlertController.init(title: "Inside Blue Layer", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { (_) in
                print("点击蓝色成功")
            }))
            self.present(alertView, animated: true, completion: nil)
        } else if layer == self.layerView.layer {
            let alertView = UIAlertController.init(title: "Inside White Layer", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { (_) in
                print("点击白色成功")
            }))
            self.present(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController.init(title: "不在范围内", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: { (_) in
                print("不在范围内")
            }))
            self.present(alertView, animated: true, completion: nil)
        }
    }
}
