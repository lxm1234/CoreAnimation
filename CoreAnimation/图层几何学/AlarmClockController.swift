//
//  AlarmClockController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class AlarmClockController: UIViewController {

    @IBOutlet weak var hourHander: UIImageView!
    @IBOutlet weak var minuteHaner: UIImageView!
    @IBOutlet weak var secondHander: UIImageView!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.changeAnchorPoint()
        self.tick()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    func changeAnchorPoint() {
        self.hourHander.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9)
        self.minuteHaner.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9)
        self.secondHander.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.9)
    }
    
    @objc func tick(){
        //convert time to hours, minutes and seconds
        let calendar = Calendar(identifier: .gregorian)
        let units:Set<Calendar.Component> = [Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second]
        let components = calendar.dateComponents(units, from: Date())
        let hourAngle = (CGFloat(components.hour!) / 12.0) * CGFloat.pi * 2.0
        //calculate hour hand angle //calculate minute hand angle
        let minsAngle = (CGFloat(components.minute!) / 60.0) * CGFloat.pi * 2.0;
        //calculate second hand angle
        let secsAngle = (CGFloat(components.second!) / 60.0) * CGFloat.pi * 2.0;
        //rotate hands
        self.hourHander.transform = CGAffineTransform(rotationAngle: hourAngle)
        self.minuteHaner.transform = CGAffineTransform(rotationAngle: minsAngle);
        self.secondHander.transform = CGAffineTransform(rotationAngle: secsAngle);
    }
    
    deinit {
        self.timer?.invalidate()
    }
}
