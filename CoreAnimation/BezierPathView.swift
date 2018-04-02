//
//  BezierPathView.swift
//  CoreAnimation
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class BezierPathView: UIView {

    var methodString: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let sel = NSSelectorFromString(self.methodString)
        if self.responds(to: sel) {
            self.perform(sel)
        }
    }
    
    //pragma mark - 矩形
    @objc func drawRect() {
        let path = UIBezierPath(rect: CGRect.init(x: 10, y: 10, width: self.frame.size.width-20, height: self.frame.size.height - 20))
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    //pragma mark - 椭圆
    @objc func drawOval() {
        let path = UIBezierPath.init(ovalIn: CGRect.init(x: 10, y: 10, width: self.frame.size.width-20, height: self.frame.size.height - 20))
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
   
    //pragma mark - 矩形带圆角
    @objc func drawRoundedRect(){
        let path = UIBezierPath.init(roundedRect:  CGRect.init(x: 10, y: 10, width: self.frame.size.width-20, height: self.frame.size.height - 20), cornerRadius: 10.0)
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
   
    //pragma mark - 矩形带指定圆角
    @objc func drawRoundedRectWithCorners() {
        let path = UIBezierPath.init(roundedRect: CGRect.init(x: 10, y: 10, width: self.frame.size.width-20, height: self.frame.size.height - 20), byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize.init(width: 10.0, height: 10.0))
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    
    //pragma mark - 圆形
    @objc func drawArc(){
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    
    //pragma mark - 弧形
    @objc func drawArcHalf() {
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    //pragma mark - 扇形
    @objc func drawSector()  {
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0))
        path.close()
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    //pragma mark - 直线
    @objc func drawLine() {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addLine(to: CGPoint.init(x: self.frame.size.width/2.0, y: 0))
        path.addLine(to: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0))
        path.close()
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    //pragma mark - 绘制三次曲线
    @objc func drawCurveToPoint() {
        let path = UIBezierPath()
        //起始点
        path.move(to: CGPoint.init(x: 0, y: 0))
        //终点、控制点1、控制点2
        path.addCurve(to: CGPoint.init(x: 0, y: self.frame.height/2.0)
            , controlPoint1: CGPoint(x: self.frame.size.width/2.0, y: 0)
            , controlPoint2: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    
    //pragma mark - 绘制二次曲线
    @objc func drawQuadCurveToPoint()  {
        let path = UIBezierPath()
        //起始点
        path.move(to: CGPoint(x: 0, y: self.frame.size.height))
        //终点、控制点1
        path.addQuadCurve(to: CGPoint(x: self.frame.size.width, y: 0),
                          controlPoint: CGPoint(x:self.frame.size.width,y:self.frame.size.height))
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    //pragma mark - 绘制进度条、待定
    @objc func drawProgress(){
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x:self.frame.size.width/2.0,y:self.frame.size.height/2.0), radius: 50.0, startAngle: 0, endAngle: CGFloat.pi/2, clockwise: true)
        path.lineWidth = 2.0
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
    }
    //pragma mark - lineCapStyle、lineJoinStyle样式设置
    @objc func drawLineStyle() {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: self.frame.size.width/2.0, y: 0))
        path.addLine(to: CGPoint.init(x: self.frame.size.width/2.0, y: self.frame.size.height/2.0))
        path.addLine(to: CGPoint.init(x: self.frame.size.width, y: self.frame.size.height/2.0))
        
        path.lineWidth = 10
        UIColor.green.setStroke()
        UIColor.red.setFill()
        path.stroke()
        
    }
    //usesEvenOddFillRule
    @objc func drawLineWithFillRule() {
        
    }
    //绘制虚线
    @objc func drawLineDash() {
        
    }

}
