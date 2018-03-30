//
//  expandButtonAreaController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class expandButtonAreaController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let coverView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        coverView.backgroundColor = UIColor.clear
        coverView.layer.borderColor = UIColor.red.cgColor
        coverView.layer.borderWidth = 1.0
        self.view.addSubview(coverView)
       
//        let button = HWButton.init(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
//        button.hitTestEdgeInsets = UIEdgeInsets(top: -50, left: -50, bottom: -50, right: -50)
//        button.minimumHitTestWidth = 200
//        button.minimumHitTestHeight = 200
        
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        button.hit1TestEdgeInsets = UIEdgeInsets(top: -50, left: -50, bottom: -50, right: -50)
        button.setTitle("点我呀", for: .normal)
        button.setTitle("点中了", for: .highlighted)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        button.center = coverView.center
    }
}
