//
//  MaskViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        //create mask layer
        let maskLayer = CALayer()
        maskLayer.frame = self.imageView.bounds
        let maskImage = UIImage.init(named: "Cone")
        maskLayer.contents = maskImage?.cgImage
        //apply mask to image layer
        self.imageView.layer.mask = maskLayer;
    }
}
