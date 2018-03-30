//
//  SplitImageController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class SplitImageController: UIViewController {

    let firstView = UIView.init(frame: CGRect.init(x: 0, y: 100, width: 150, height: 150))
    let secondView = UIView.init(frame: CGRect.init(x: 200, y: 100, width: 150, height: 150))
    let thirdView = UIView.init(frame: CGRect.init(x: 0, y: 400, width: 150, height: 150))
    let fourView = UIView.init(frame: CGRect.init(x: 200, y: 400, width: 150, height: 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        firstView.backgroundColor = UIColor.brown
        secondView.backgroundColor = UIColor.brown
        thirdView.backgroundColor = UIColor.brown
        fourView.backgroundColor = UIColor.brown
        self.view.addSubview(firstView)
        self.view.addSubview(secondView)
        self.view.addSubview(thirdView)
        self.view.addSubview(fourView)
        self.splitImage()
    }
    
    func splitImage(){
        let image = UIImage.init(named: "pingtu3.jpg")
        self.addSpriteImage(image!, withContentRect: CGRect.init(x: 0, y: 0, width: 0.5, height: 0.5), toLayer: firstView.layer)
        self.addSpriteImage(image!, withContentRect: CGRect.init(x: 0.5, y: 0, width: 0.5, height: 0.5), toLayer: secondView.layer)
        self.addSpriteImage(image!, withContentRect: CGRect.init(x: 0, y: 0.5, width: 0.5, height: 0.5), toLayer: thirdView.layer)
        self.addSpriteImage(image!, withContentRect: CGRect.init(x: 0.5, y: 0.5, width: 0.5, height: 0.5), toLayer: fourView.layer)
    }
    func addSpriteImage(_ image:UIImage, withContentRect rect:CGRect, toLayer layer:CALayer) {
        layer.contents = image.cgImage
        layer.contentsGravity = kCAGravityResizeAspect
        layer.contentsRect = rect
    }

}
