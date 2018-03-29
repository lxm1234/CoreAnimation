//
//  ChangeAnchorPointController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ChangeAnchorPointController: UIViewController {

    var viewTwo: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let viewOne = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        viewOne.backgroundColor = UIColor.red
        self.view.addSubview(viewOne)
        
        let viewTwo = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        viewTwo.center = viewOne.center
        viewTwo.backgroundColor = UIColor.blue
        self.viewTwo = viewTwo
        self.view.addSubview(viewTwo)
        print("frame = \(NSStringFromCGRect((self.viewTwo!.frame)))")
        print("bounds = \(NSStringFromCGRect(self.viewTwo!.bounds))")
        
        let button = UIButton(frame: CGRect.init(x: 100, y: 300, width: 100, height: 20))
        button.setTitle("更改锚点", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(changeAnchorPoint(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func changeAnchorPoint(sender:UIButton) {
        self.viewTwo!.layer.anchorPoint = CGPoint.init(x: 0, y: 0)
        print("frame = \(NSStringFromCGRect((self.viewTwo!.frame)))")
        print("bounds = \(NSStringFromCGRect(self.viewTwo!.bounds))")
    }
}
