//
//  LayerCreateController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class LayerCreateController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let layerView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        layerView.backgroundColor = UIColor.brown
        self.view.addSubview(layerView)
        
        let layer = CALayer.init()
        layer.frame = CGRect.init(x: 0, y: 0, width: 64, height: 64)
        layer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(layer)
    }
}
