//
//  threeDTransformController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class threeDTransformController: UIViewController {

    @IBOutlet var imageViewArray: [UIImageView]!
    @IBOutlet weak var contentView: UIView!
    var diceAngle = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(viewTransform(handle:)))
        self.contentView.addGestureRecognizer(pan)
        //add cube face 1
        var diceTransform = CATransform3DIdentity
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 75)
        self.addFace(index: 0, withTransform: diceTransform)
        //add cube face 2
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, 75, 0, 0)
        diceTransform = CATransform3DRotate(diceTransform, CGFloat.pi/2, 0, 1, 0)
        self.addFace(index: 1, withTransform: diceTransform)
        //add cube face 3
        //move this code after the setup for face no. 6 to enable button
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -75, 0)
        diceTransform = CATransform3DRotate(diceTransform, CGFloat.pi/2, 1, 0, 0);
        self.addFace(index: 2, withTransform: diceTransform)
        //add cube face 4
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 75, 0)
        diceTransform = CATransform3DRotate(diceTransform, -CGFloat.pi/2, 1, 0, 0)
        self.addFace(index: 3, withTransform: diceTransform)
        //add cube face 5
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, -75, 0, 0)
        diceTransform = CATransform3DRotate(diceTransform, -CGFloat.pi/2, 0, 1, 0)
        self.addFace(index: 4, withTransform: diceTransform)
        //add cube face 6
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -75);
        diceTransform = CATransform3DRotate(diceTransform, CGFloat.pi, 0, 1, 0);
        self.addFace(index: 5, withTransform: diceTransform)

    }
    
    func addFace(index: Int,withTransform transform:CATransform3D) {
        let face = self.imageViewArray[index]
        self.contentView.addSubview(face)
        let containerSize = self.contentView.bounds.size
        face.center = CGPoint.init(x: containerSize.width/2.0, y: containerSize.height/2.0)
        face.layer.transform = transform
        face.layer.isDoubleSided = false
    }
    
    @objc func viewTransform(handle sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self.contentView)
        let angleX = self.diceAngle.x + point.x/30
        let angleY = self.diceAngle.y - point.y/30
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        self.contentView.layer.sublayerTransform = transform
        if sender.state == UIGestureRecognizerState.ended {
            self.diceAngle = CGPoint(x: angleX, y: angleY)
        }
    }
}
