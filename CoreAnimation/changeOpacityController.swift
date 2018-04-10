//
//  changeOpacityController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class changeOpacityController: UIViewController {

    var testView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let oneView = UIView(frame: CGRect(x: 0, y: 64, width: 100, height: 100))
        oneView.backgroundColor = UIColor.red
        self.testView = oneView
        self.view.addSubview(oneView)
        
        let button = UIButton(frame: CGRect(x: 0, y: 200, width: 50, height: 50))
        button.addTarget(self, action: #selector(changeOpacity), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }
    
    @objc func changeOpacity() {
        //显示动画－－不会改变layer的内部属性
        let fadeAnim = CABasicAnimation(keyPath: "opacity")
        fadeAnim.fromValue = NSNumber(value: 1.0)
        fadeAnim.toValue = NSNumber(value: 0.0)
        fadeAnim.duration = 3.0
        self.testView?.layer.add(fadeAnim, forKey: "opacity")
        //这里需要手动改变内部属性
        self.testView?.layer.opacity = 0.0
    }

}
