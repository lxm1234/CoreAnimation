//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private lazy var sections: [String] =
        ["图层树"
        ,"寄宿图"
        ,"图层几何学"
        ,"视觉效果"
        ,"变换"
        ,"专用图层"
        ,"动画制作方式"
        ,"动画和layer属性关系"]
    
    private lazy var dataSources:[[String]] =
        [["添加图层"]
        ,["layer显示图片","layer分割图片","layer拉伸图片","layer重绘"]
        ,["锚点-观察frame","锚点-闹钟","坐标系转化","Z坐标轴","Hit Testing","扩大按钮的点击范围","子类超出父类范围","scrollView预览界面","自动布局Xib"]
        ,["圆角和图层边框","阴影","阴影剪裁","阴影按照形状剪裁", "基本图层蒙版","蒙版动态显示","动态移动控件的两种方法","蒙版动态显示增强","拉伸过滤"]
        ,["仿射变换","3D变换"]
        ,["贝赛尔曲线基础知识","CAShapeLayer基础知识","进度条总结","CATextLayer"]
        ,["UIView制作动画的三种方式"]
        ,["UIView更改透明度"]]
    
    private lazy var controllers : [[String]] =
    [["LayerCreateController"],
    ["layerShowImageController",
    "SplitImageController",
    "stretchViewController",
    "redrawViewController"],
    ["ChangeAnchorPointController",
    "AlarmClockController",
    "ConvertPointController",
    "ZPositionController",
    "HitTestingController",
    "expandButtonAreaController",
    "beyondRangeController",
    "scrollViewPreviewController",
    "AutoLayoutController"],
    ["cornerViewController",
    "shadowController",
    "shadowTailoringController",
    "shadowPathController",
    "MaskViewController",
    "DynamicMaskController",
    "TwoMethodsMoveViewController",
    "DynamicMaskImprovedController",
    "FilterViewController"],
    ["AffineTransformController",
    "BasicThreeListViewController"],
    ["BezierPathViewController",
    "CAShapeLayerController",
    "CAProgressController",
    "TextLayerListController"],
    ["threeMethodsController"],
    ["changeOpacityController"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    
    //dataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSources[indexPath.section][indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    //delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vcClass = NSClassFromString(getAPPName() + "." + controllers[indexPath.section][indexPath.row]) as? UIViewController.Type {
            let vc = vcClass.init()
            self.show(vc, sender: nil)
        }
    }
}

