//
//  shadowPathController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class shadowPathController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        let image = UIImage.init(named: "2.jepg")
        let firstView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        firstView.image = image
        firstView.contentMode = .scaleAspectFit
        self.view.addSubview(firstView)
        
        let secondView = UIImageView(frame: CGRect(x: 100, y: 350, width: 200, height: 200))
        secondView.image = image
        secondView.contentMode = .scaleAspectFit
        self.view.addSubview(secondView)
        
        firstView.layer.shadowOpacity = 0.5
        secondView.layer.shadowOpacity = 0.5
        
        //方形轮廓
        let squarePath = CGMutablePath()
        squarePath.addRect(firstView.bounds)
        firstView.layer.shadowPath = squarePath
        
        //圆形轮廓
        let circlePath = CGMutablePath()
        circlePath.addEllipse(in: secondView.bounds)
        secondView.layer.shadowPath = circlePath
    }
}
