//
//  shadowController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class shadowController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
        //shadowOpacity:0~1
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.black.cgColor
        //shadowOffset默认(0,-3)、控制着左右上下位移
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 20.0
        
        //阴影按照轮廓
        self.imageView.layer.shadowOpacity = 0.5;
        self.imageView.layer.shadowColor = UIColor.black.cgColor
        //shadowOffset默认(0,-3)、控制着左右上下位移
        self.imageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.imageView.layer.shadowRadius = 20.0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
