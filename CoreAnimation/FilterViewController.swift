//
//  FilterViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/30.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    var timer: Timer?
    
    @IBOutlet var allViews: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let digits = UIImage.init(named: "Digits.png")
        for view in self.allViews {
            view.layer.contents = digits?.cgImage
            view.layer.contentsRect = CGRect.init(x: 0, y: 0, width: 0.1, height: 1.0)
            view.layer.contentsGravity = kCAGravityResizeAspect
            //不加上这句话，图片显示不清楚
            view.layer.magnificationFilter = kCAFilterNearest

        }
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        //convert time to hours, minutes and seconds
        let calendar = Calendar.init(identifier: .gregorian)
        let units:Set<Calendar.Component> = [Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second]
        let components = calendar.dateComponents(units, from: Date())
        //set hours
        setDigit(components.hour!/10, forView: self.allViews[0])
        setDigit(components.hour!%10, forView: self.allViews[1])
        //set minutes
        setDigit(components.minute!/10, forView: self.allViews[2])
        setDigit(components.minute!%10, forView: self.allViews[3])
        
        //set seconds
        setDigit(components.second!/10, forView: self.allViews[4])
        setDigit(components.second!%10, forView: self.allViews[5])
    }
    
    func setDigit(_ digit: Int, forView view:UIView) {
        view.layer.contentsRect = CGRect.init(x: CGFloat(digit) * 0.1, y: 0, width: 0.1, height: 1.0)
    }
}
