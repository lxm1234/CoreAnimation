//
//  CircleViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/8.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

var tempValue: CGFloat = 0.0

class CircleViewController: UIViewController {

    var circleView: CircleView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        tempValue = 0.0
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 300, width: 100, height: 50))
        button.addTarget(self, action: #selector(changeProgress(sender:)), for: .touchUpInside)
        button.setTitle("更改进度", for: .normal)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        
        let circleView = CircleView.init(frame: CGRect.init(x: 200, y: 200, width: 150, height: 150))
        self.circleView = circleView
        circleView.progress = 0
        self.view.addSubview(circleView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeProgress(sender:UIButton) {
        if tempValue < 1.0 {
            tempValue += 0.1
            self.circleView?.progress = tempValue
        } else {
            self.circleView?.progress = 0
            tempValue = 0
        }
    }
}
