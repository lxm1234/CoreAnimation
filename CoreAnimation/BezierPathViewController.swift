//
//  BezierPathViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class BezierPathViewController: UIViewController {

    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight-64))
        scrollView.backgroundColor = UIColor.brown
        scrollView.contentSize = CGSize.init(width: ScreenWidth + 50, height: ScreenHeight - 64)
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.bounces = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(scrollView)
        self.drawRect()
        self.drawOval()
        self.drawRoundedRect()
        self.drawRoundedRectWithCorners()
        self.drawArc()
        self.drawArcHalf()
        self.drawSector()
        self.drawLine()
        self.drawCurveToPoint()
        self.drawQuadCurveToPoint()
        self.drawProgress()
        self.drawLineStyle()
//        self.drawLineWithFillRule()
//        self.drawLineDash()
    }
    
    //pragma mark - 矩形
    func drawRect()  {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 10, y: 10, width: 100, height: 100))
        bezierView.methodString = "drawRect"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 椭圆
    func drawOval()  {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 150, y: 10, width: 100, height: 50))
        bezierView.methodString = "drawOval"
        self.scrollView.addSubview(bezierView)
    }
    //pragma mark - 矩形带圆角
    func drawRoundedRect(){
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 300, y: 10, width: 100, height: 100))
        bezierView.methodString = "drawRoundedRect"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 矩形带指定圆角
    func drawRoundedRectWithCorners() {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 10, y: 150, width: 100, height: 100))
        bezierView.methodString = "drawRoundedRectWithCorners"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 圆形
    func drawArc(){
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 150, y: 150, width: 100, height: 100))
        bezierView.methodString = "drawArc"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 弧形
    func drawArcHalf()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 300, y: 150, width: 100, height: 100))
        bezierView.methodString = "drawArcHalf"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 扇形
    func drawSector()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 10, y: 250, width: 100, height: 100))
        bezierView.methodString = "drawSector"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 直线
    func drawLine()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 160, y: 300, width: 100, height: 100))
        bezierView.methodString = "drawLine"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 绘制三次曲线
    func drawCurveToPoint()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 300, y: 300, width: 100, height: 100))
        bezierView.layer.borderColor = UIColor.blue.cgColor
        bezierView.layer.borderWidth = 2.0
        bezierView.methodString = "drawCurveToPoint"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 绘制二次曲线
    func drawQuadCurveToPoint()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 0, y: 450, width: 100, height: 100))
        bezierView.layer.borderColor = UIColor.blue.cgColor
        bezierView.layer.borderWidth = 2.0
        bezierView.methodString = "drawQuadCurveToPoint"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - 绘制进度条、待定
    func drawProgress()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 150, y: 450, width: 100, height: 100))
        bezierView.layer.borderColor = UIColor.blue.cgColor
        bezierView.layer.borderWidth = 2.0
        bezierView.methodString = "drawProgress"
        self.scrollView.addSubview(bezierView)
    }
    
    //pragma mark - lineCapStyle、lineJoinStyle样式设置
    func drawLineStyle()
    {
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 300, y: 450, width: 100, height: 100))
        bezierView.layer.borderColor = UIColor.blue.cgColor
        bezierView.layer.borderWidth = 2.0
        bezierView.methodString = "drawLineStyle"
        self.scrollView.addSubview(bezierView)
    }
    
    //usesEvenOddFillRule
    func drawLineWithFillRule()
    {
    
    }
    
    //绘制虚线
    func drawLineDash()
    {
    
    }
    
    

}
