//
//  AttributeLabelController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/10.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class AttributeLabelController: UIViewController {

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
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.isWrapped = true
        textLayer.contentsScale = UIScreen.main.scale
        
        //创建富文本
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet lobortis"
        let string = NSMutableAttributedString(string: text)
        //设置文本属性
        let font = UIFont.systemFont(ofSize: 15.0)
        let fontName = font.fontName as CFString
        let fontSize = font.pointSize
        let fontRef = CTFontCreateWithName(fontName, fontSize, nil)
        var attributes:[ NSAttributedStringKey: Any] = [NSAttributedStringKey.foregroundColor:UIColor.black.cgColor
            ,NSAttributedStringKey.font:fontRef]
        string.setAttributes(attributes, range: NSRange(location: 0, length: text.count))
        attributes = [NSAttributedStringKey.foregroundColor:UIColor.red.cgColor
            ,NSAttributedStringKey.underlineStyle:NSNumber(value: CTUnderlineStyle.single.rawValue)
            ,NSAttributedStringKey.font:fontRef]
        string.setAttributes(attributes, range: NSRange.init(location: 6, length: 5))
        //设置文本内容
        textLayer.string = string;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
