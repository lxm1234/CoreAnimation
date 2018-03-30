//
//  TwoMethodsMoveViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class TwoMethodsMoveViewController: UIViewController {

    let touchView = UIView.init(frame: CGRect.init(x: ScreenWidth - 150, y: 64, width: 150, height: 100))
    private var isMove: Bool = false
    private var legend_point = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //1、利用手势
        let gestureView = UIView.init(frame: CGRect.init(x: 0, y: 64, width: 150, height: 100))
        gestureView.backgroundColor = UIColor.clear
        gestureView.layer.borderColor = UIColor.red.cgColor
        gestureView.layer.borderWidth = 2.0
        
        let gestureLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 20))
        gestureLabel.textAlignment = .center
        gestureLabel.text = "利用手势滑动"
        gestureView.addSubview(gestureLabel)
        gestureLabel.center = CGPoint.init(x: 75, y: 50)
        self.view.addSubview(gestureView)
        //添加手势
        let panGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(doMoveAction(handlePan:)))
        gestureView.addGestureRecognizer(panGestureRecognizer)
        //2、利用UITouch
        self.touchView.backgroundColor = UIColor.clear
        self.touchView.layer.borderColor = UIColor.black.cgColor
        self.touchView.layer.borderWidth = 2.0
        
        let touchLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 100))
        touchLabel.textAlignment = .center
        touchLabel.text = "利用touch滑动"
        self.touchView.addSubview(touchLabel)
        touchLabel.center = CGPoint.init(x: 75, y: 50)
        self.view.addSubview(self.touchView)
    }
    
    @objc func doMoveAction(handlePan recognizer:UIPanGestureRecognizer) {
        //1、手势在self.view坐标系中移动的位置
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            var newCenter = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            //2、限制屏幕范围：
            newCenter.y = max(view.frame.size.height/2 + 64, newCenter.y)
            newCenter.y = min(self.view.frame.size.height - view.frame.size.height/2, newCenter.y)
            newCenter.x = max(view.frame.size.width/2, newCenter.x)
            newCenter.x = min(self.view.frame.size.width - view.frame.size.width / 2, newCenter.x)
            //设置中心点范围
            view.center = newCenter
            //3、将手势坐标点归0、否则会累加
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.isMove = false
        let touch = touches.first
        let point = touch!.location(in: self.view)
        if self.touchView.frame.contains(point) {
            self.legend_point = touch!.location(in: self.touchView)
            self.isMove = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if !self.isMove {
            return
        }
        let touch = touches.first
        var point = touch!.location(in: self.view)
        point.x += self.touchView.frame.size.width/2.0 - self.legend_point.x
        point.y += self.touchView.frame.size.height/2.0 - self.legend_point.y
        point.y = max(self.touchView.frame.size.height/2 + 64, point.y)
        point.y = min(self.view.frame.size.height - self.touchView.frame.size.height/2, point.y)
        point.x = max(self.touchView.frame.size.width/2, point.x)
        point.x = min(self.view.frame.size.width - self.touchView.frame.size.width / 2, point.x)
        
        self.touchView.center = point;
    }
}
