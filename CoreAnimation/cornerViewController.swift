//
//  cornerViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class cornerViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstView.layer.cornerRadius = 20.0
        self.secondView.layer.cornerRadius = 20.0
        self.secondView.layer.masksToBounds = true
        
        self.firstView.layer.borderWidth = 5.0
        self.secondView.layer.borderWidth = 5.0
    }

}
