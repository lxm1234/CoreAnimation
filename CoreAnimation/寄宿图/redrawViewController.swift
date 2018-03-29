//
//  redrawViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class redrawViewController: UIViewController {

    var blueLayer: CALayer?
    var layerView = UIView.init(frame: CGRect.init(x: 100, y: 150, width: 200, height: 200))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.layerView.backgroundColor = UIColor.white
        self.view.addSubview(layerView)
        //create sublayer
        let blueLayer = CALayer()
        blueLayer.frame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        self.blueLayer = blueLayer
        
        //set controller as layer delegate
        blueLayer.delegate = self
        
        //ensure that layer backing image uses correct scale
        blueLayer.contentsScale = UIScreen.main.scale
        self.layerView.layer.addSublayer(blueLayer)
        //force layer to redraw
        blueLayer.display()
    }
    deinit {
        self.blueLayer?.delegate = nil
    }
}

extension redrawViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(5.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
