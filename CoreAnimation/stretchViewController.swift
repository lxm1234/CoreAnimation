//
//  stretchViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class stretchViewController: UIViewController {

    var firstLayer: CALayer?
    var secondLayer: CALayer?
    var thirdLayer: CALayer?
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initLayer()
        self.stretchImage()
        self.setContentsCenter()
    }
    
    func initLayer() {
        let img = UIImage(named: "Button2")?.cgImage
        let layer = CALayer()
        self.firstLayer = layer
        layer.contents = img
        layer.frame = CGRect.init(x: 0, y: 70, width: img?.width ?? 0, height: img?.height ?? 0)
        layer.contentsScale = UIScreen.main.scale
        self.view.layer.addSublayer(layer)
    }
    
    func stretchImage() {
        //创建CGImageRef（test.png是工程Bundle中的资源图片文件）
        let img = UIImage(named: "Button2")?.cgImage
        //创建CALayer
        let layer = CALayer()
        self.secondLayer = layer
        //设置CALayer的内容
        layer.contents = img
        let originY = self.firstLayer!.frame.maxY
        layer.frame = CGRect.init(x: 0, y: Int(originY + 50), width: img?.width ?? 0, height: img?.height ?? 0)
        //添加Layer到View
        self.view.layer.addSublayer(layer)
        //选择右上角的四分之一为内容
        layer.contentsRect = CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5)
        //拉伸
        layer.contentsGravity = kCAGravityResize
    }
    
    func setContentsCenter() {
        //创建CGImageRef（test.png是工程Bundle中的资源图片文件）
        let img = UIImage(named: "Button2")?.cgImage
        //创建CALayer
        let layer = CALayer()
        self.thirdLayer = layer
        //设置CALayer的内容
        layer.contents = img
        let originY = self.secondLayer!.frame.maxY
        layer.frame = CGRect.init(x: 0, y: Int(originY + 50), width: img?.width ?? 0, height: img?.height ?? 0)
        //添加Layer到View
        self.view.layer.addSublayer(layer)
        //选择右上角的四分之一为内容
        layer.contentsRect = CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5)
        //拉伸
        layer.contentsGravity = kCAGravityResize
        //左下角的四分之一拉伸
        //前提是图片被拉伸才有效
        layer.contentsCenter = CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5)
    }
    
}
