//
//  shadowTailoringController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class shadowTailoringController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var secondView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstView.layer.cornerRadius = 20
        self.secondView.layer.cornerRadius = 20
        
        self.firstView.layer.borderWidth = 5.0
        self.secondView.layer.borderWidth = 5.0
        
        self.firstView.layer.shadowOpacity = 0.5
        self.firstView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.firstView.layer.shadowRadius = 5.0
        
        self.shadowView.layer.shadowOpacity = 0.5;
        self.shadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.shadowView.layer.shadowRadius = 5.0
        
        self.secondView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
