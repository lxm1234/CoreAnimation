//
//  ZPositionController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ZPositionController: UIViewController {

    @IBOutlet weak var green: UIView!
    @IBOutlet weak var red: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect.init(x: 100, y: 100, width: 150, height: 20))
        button.setTitle("更改zPosition", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(changeZPoint(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func changeZPoint(sender:UIButton) {
        //zPosition 提高一个像素就可以让绿色视图前置
        //当然0.1或者0.0001也能够做到
        //但是最好不要这样,因为浮点类型四舍五入的计算可能会造成一些不便的麻烦
        self.green.layer.zPosition = 1.0
    }
}
