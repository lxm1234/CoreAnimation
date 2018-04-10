//
//  LabelLayerController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class LabelLayerController: UIViewController {

    @IBOutlet weak var labelView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelView.backgroundColor = UIColor.clear
        self.labelView.layer.borderColor = UIColor.red.cgColor
        self.labelView.layer.borderWidth = 1.0
        let textLayer = CATextLayer()
        textLayer.frame = self.labelView.bounds
        self.labelView.layer.addSublayer(textLayer)
        //设置textLayer
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.isWrapped = true
        let font = UIFont.systemFont(ofSize: 15.0)
        let fontName = font.fontName as CFString
        let fontRef = CGFont(fontName)
        textLayer.font = fontRef
        textLayer.fontSize = font.pointSize
        //设置textLayer内容
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis"
        textLayer.string = text
        //适应Retina屏幕
        textLayer.contentsScale = UIScreen.main.scale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
