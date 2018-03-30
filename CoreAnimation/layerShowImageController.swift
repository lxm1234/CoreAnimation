//
//  layerShowImageController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class layerShowImageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let image = UIImage.init(named: "2.jpeg")
        //1、直接设置图片、图片虚胖、图片填充
        let firstView = UIView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenWidth / 2, height: ScreenWidth / 2))
        firstView.backgroundColor = UIColor.brown
        self.view.addSubview(firstView)
        firstView.layer.contents = image?.cgImage
        //2、解决虚胖问题、按照当前View宽高比例，把图片同比例缩放
        let secondView = UIView.init(frame: CGRect.init(x: ScreenWidth / 2, y: 270, width: ScreenWidth / 2, height: ScreenWidth / 2))
        secondView.backgroundColor = UIColor.brown
        self.view.addSubview(secondView)
        secondView.layer.contents = image?.cgImage
        secondView.layer.contentsGravity = kCAGravityResizeAspect
        //3、图片会以原图显示
        let threeView = UIView.init(frame: CGRect.init(x: 0, y: ScreenHeight - ScreenWidth / 2, width: ScreenWidth / 2, height: ScreenWidth / 2))
        threeView.backgroundColor = UIColor.brown
        self.view.addSubview(threeView)
        threeView.layer.contents = image?.cgImage
        threeView.layer.contentsGravity = kCAGravityCenter
        //这里是用来支持高分辨率的、这就是Retina屏幕
        //设置为1.0则每个点1个像素绘制图片
        //设置为2.0则每个点2个像素绘制图片
        threeView.layer.contentsScale = UIScreen.main.scale
        //截取多余图片、效果一致
        //threeView.clipsToBounds = true;
        threeView.layer.masksToBounds = true;
        
        
    }
}
