//
//  CAShapeLayerController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class CAShapeLayerController: UIViewController {

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
        self.drawLineWithFillRule()
        self.drawLineDash()
    }
    
    //pragma mark - 矩形
    func drawRect()  {
        let path = UIBezierPath(rect: CGRect(x: 10, y: 10, width: 100, height: 100))
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 椭圆
    func drawOval()  {
        let path = UIBezierPath(ovalIn: CGRect(x: 150, y: 10, width: 100, height: 50))
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    //pragma mark - 矩形带圆角
    func drawRoundedRect(){
        let path = UIBezierPath.init(roundedRect:  CGRect.init(x: 300, y: 10, width: 100, height: 100), cornerRadius: 10.0)
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 矩形带指定圆角
    func drawRoundedRectWithCorners() {
        let path = UIBezierPath.init(roundedRect: CGRect.init(x: 10, y: 150, width: 100, height: 100), byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize.init(width: 10.0, height: 10.0))
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 圆形
    func drawArc(){
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: 200, y: 200), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 弧形
    func drawArcHalf()
    {
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: 350, y: 200), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 扇形
    func drawSector()
    {
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: 60, y: 350), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: CGPoint.init(x: 60, y: 350))
        path.close()
        
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 直线
    func drawLine()
    {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 180, y: 350))
        path.addLine(to: CGPoint.init(x: 230, y: 350))
        path.addLine(to: CGPoint.init(x: 230, y: 400))
        path.close()
        
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        self.scrollView.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 绘制三次曲线
    func drawCurveToPoint()
    {
        let viewTemp = UIView(frame: CGRect(x: 300, y: 320, width: 100, height: 100))
        viewTemp.layer.borderColor = UIColor.blue.cgColor
        viewTemp.layer.borderWidth = 2.0
        self.scrollView.addSubview(viewTemp)
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: viewTemp.frame.size.height/2.0), controlPoint1: CGPoint(x: viewTemp.frame.size.width/2.0, y: 0), controlPoint2: CGPoint(x: viewTemp.frame.size.width, y: viewTemp.frame.size.height))
        
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        viewTemp.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 绘制二次曲线
    func drawQuadCurveToPoint()
    {
        let viewTemp = UIView(frame: CGRect(x: 10, y: 450, width: 100, height: 100))
        viewTemp.layer.borderColor = UIColor.blue.cgColor
        viewTemp.layer.borderWidth = 2.0
        self.scrollView.addSubview(viewTemp)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: viewTemp.frame.size.height))
        path.addQuadCurve(to: CGPoint(x: viewTemp.frame.size.width, y: 0), controlPoint: CGPoint(x: viewTemp.frame.size.width, y: viewTemp.frame.size.height))
        
        let bezierView = BezierPathView.init(frame: CGRect.init(x: 0, y: 450, width: 100, height: 100))
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        viewTemp.layer.addSublayer(lineLayer)
    }
    
    //pragma mark - 绘制进度条、待定
    func drawProgress()
    {
        let viewTemp = UIView(frame: CGRect(x: 150, y: 450, width: 100, height: 100))
        viewTemp.layer.borderColor = UIColor.blue.cgColor
        viewTemp.layer.borderWidth = 2.0
        self.scrollView.addSubview(viewTemp)
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint.init(x: viewTemp.frame.size.width/2.0, y: viewTemp.frame.size.height/2.0), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi/4, clockwise: true)
    
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        viewTemp.layer.addSublayer(lineLayer)
        
        //currentPoint、containsPoint
        let tempPoint = CGPoint.init(x: viewTemp.frame.size.width,y:viewTemp.frame.size.height/2.0)
        if path.contains(tempPoint) {
            print("包含这个点")
        } else {
            print("不包含这个点")
        }
        print("currentPoint = \(NSStringFromCGPoint(path.currentPoint))")
    }
    
    //pragma mark - lineCapStyle、lineJoinStyle样式设置
    func drawLineStyle()
    {
        let viewTemp = UIView(frame: CGRect(x:300, y: 450, width: 100, height: 100))
        viewTemp.layer.borderColor = UIColor.blue.cgColor
        viewTemp.layer.borderWidth = 2.0
        self.scrollView.addSubview(viewTemp)

        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: viewTemp.frame.size.width/2.0, y: 0))
        path.addLine(to: CGPoint.init(x: viewTemp.frame.size.width/2.0, y: viewTemp.frame.size.height/2.0))
        path.addLine(to: CGPoint.init(x: viewTemp.frame.size.width, y: viewTemp.frame.size.height/2.0))
        
        
        let lineLayer = CAShapeLayer()
        lineLayer.lineWidth = 2
        lineLayer.strokeColor = UIColor.green.cgColor
        lineLayer.path = path.cgPath
        lineLayer.fillColor = UIColor.clear.cgColor
        viewTemp.layer.addSublayer(lineLayer)
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
