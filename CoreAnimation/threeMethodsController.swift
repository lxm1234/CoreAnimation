//
//  threeMethodsController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class threeMethodsController: UIViewController {

    lazy var animationView:UIView = {
       let view = UIView.init(frame: CGRect(x: 0, y: 64, width: 50, height: 50))
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.animationView)
        self.view.backgroundColor = UIColor.white
        
        let oneButton = UIButton.init(frame: CGRect(x: 0, y: ScreenHeight - 100, width: 250, height: 50))
        oneButton.addTarget(self, action: #selector(animateWithDurationMethod), for: .touchUpInside)
        oneButton.backgroundColor = UIColor.green
        oneButton.setTitle("UIView代码块调用", for: .normal)
        self.view.addSubview(oneButton)
        
        let twoButton = UIButton.init(frame: CGRect(x: 0, y: ScreenHeight - 200, width: 250, height: 50))
        twoButton.addTarget(self, action: #selector(commitAnimationsMethod), for: .touchUpInside)
        twoButton.backgroundColor = UIColor.blue
        twoButton.setTitle("UIView[begin commit]模式", for: .normal)
        self.view.addSubview(twoButton)
        
        let threeButton = UIButton.init(frame: CGRect(x: 0, y: ScreenHeight - 300, width: 250, height: 50))
        threeButton.addTarget(self, action: #selector(coreAnimationMethod), for: .touchUpInside)
        threeButton.backgroundColor = UIColor.brown
        threeButton.setTitle("使用Core Animation中的类", for: .normal)
        self.view.addSubview(threeButton)
    }
    
    @objc func animateWithDurationMethod()  {
        self.animationView.frame = CGRect(x: 0, y: 64, width: 50, height: 50)
        UIView.animate(withDuration: 5.0, animations: {
            self.animationView.frame = CGRect(x: 0, y: ScreenHeight - 50, width: 50, height: 50)
        }) { (finished) in
            self.animationView.frame = CGRect(x: 0, y: ScreenHeight / 2.0, width: 50, height: 50)
        }
    }
    
    @objc func commitAnimationsMethod() {
        self.animationView.frame = CGRect(x: 0, y: 64, width: 50, height: 50)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(5.0)
        self.animationView.frame = CGRect(x: 0, y: ScreenHeight - 50, width: 50, height: 50)
        UIView.commitAnimations()
    }
    
    @objc func coreAnimationMethod()  {
        self.animationView.frame = CGRect(x: 0, y: 64, width: 50, height: 50)
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.animationView.frame.size.width / 2.0, y: 64 + 25))
        animation.toValue = NSValue(cgPoint: CGPoint(x: ScreenWidth - 25, y: 64 + 25))
        animation.duration = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        self.animationView.layer.add(animation, forKey: "positionAnimation")
    }

}
