
//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


// Label 最好不要根ScrollView直接关联使用，因为ScrollView的ContentSize会自适应撑大、Label页会自适应
// Label 加入到一个UIView后，在加入到ScrollView

// Label 常识： 不设置Height（设置Height是绝对不惧）
// frame、bounds 差别： frame有x、y，bounds没有x、y。它们的width、height指向的是同一个东西


// MARK: - 初始化
internal final class UnitColorSystemController: UIViewController {
    
    // UIScrollView 能不能滚动根它的contentSize的大小有关，太小则不能滚动
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView(frame: CGRect.zero)
        // 自适应父视图
        scrollV.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        scrollV.backgroundColor = UIColor.gray
        scrollV.showsHorizontalScrollIndicator = true
        scrollV.showsVerticalScrollIndicator = true
        scrollV.indicatorStyle = .black
        scrollV.isScrollEnabled = true // 可以上下滚动
        scrollV.bounces = true//设置是否可以拉出空白区域
        //alwaysBounceVertical默认是false。
        //如果是true并且bounces也是true，即使内容尺寸比scrollView的尺寸小，也能垂直推动
        scrollV.alwaysBounceVertical = true
        
        /*isDirectionalLockEnabled
          如果这个性能被设置成false，scrollView会被允许在水平和垂直两个方向滚动。
         如果设置性能是true并且用户开始在一个方向拖动时（水平方向或垂直方向），
         滚动视图就不能在另一个方向滚动。如果拖动的方向时斜对角线方向，
         拖动事件将会被锁住并且用户可以在任何方向拖动，直到拖动事件结束。这个属性的默认值是false。
        */
        scrollV.isDirectionalLockEnabled = true

        
        //如果是把要拉伸的图片加到UIScrollview上边，那么对该scrollview做：
        //scrollV.canCancelContentTouches = false//用于控制内容视图中的触摸是否始终导致跟踪。
        //scrollV.delaysContentTouches = false//用于确定滚动视图是否延迟了触摸式手势的处理(防止只响应UIScrollview的事件)
        
        self.view.addSubview(scrollV)
        scrollV.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.bottom.equalTo(self.view).offset(-20)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
        }
        
        
        let viewWidth =  self.view.frame.size.width - 50
        //let viewWidth =  scrollV.frame.size.width
        //UIScrollView 设置内容大小
        //UIScrollView 能不能滚动根它的contentSize的大小有关，太小则不能滚动
        scrollV.contentSize = CGSize(width: 700, height: CGFloat(2000)) // 虽然width: 700,但如果Label的text内容很多 就会撑大contentSize.width
        
        debugPrint(viewWidth)
        
        return scrollV
    }()
    
    // MARK: - 页面加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //self.demoMirror()
        
        self.addLabelViewList()
        debugPrint("self.scrollView.contentSize.width = \(self.scrollView.contentSize.width)")
        debugPrint("self.scrollView.bounds.width = \(self.scrollView.bounds.width)")
        debugPrint("self.scrollView.frame.width = \(self.scrollView.frame.width)")
        
        //
    }
    
    
    
    /// <#Description#>
    private func addLabelViewList() {
        // 颜色空间：UIExtendedGrayColorSpace
        self.addLabelView(color: UIColor.black, "[UIColor.black]")
        self.addLabelView(color: UIColor.darkGray, "[UIColor.darkGray]")
        self.addLabelView(color: UIColor.lightGray, "[UIColor.lightGray]")
        self.addLabelView(color: UIColor.white, "[UIColor.white]")
        self.addLabelView(color: UIColor.gray, "[UIColor.gray]")
        self.addLabelView(color: UIColor.clear, "[UIColor.clear]")
        
        // 颜色空间：UIExtendedSRGBColorSpace
        self.addLabelView(color: UIColor.red, "[UIColor.red]")
        self.addLabelView(color: UIColor.green, "[UIColor.green]")
        self.addLabelView(color: UIColor.blue, "[UIColor.blue]")
        self.addLabelView(color: UIColor.cyan, "[UIColor.cyan]")
        self.addLabelView(color: UIColor.yellow, "[UIColor.yellow]")
        self.addLabelView(color: UIColor.magenta, "[UIColor.magenta]")
        self.addLabelView(color: UIColor.orange, "[UIColor.orange]")
        self.addLabelView(color: UIColor.purple, "[UIColor.purple]")
        self.addLabelView(color: UIColor.brown, "[UIColor.brown]")
        
    }
    
    
    /// <#Description#>
    ///
    /// - Parameter color: <#color description#>
    private func addLabelView(color: UIColor, _ text: String? = nil) {
        debugPrint(color)
        
        
        let label = UILabel.init(frame: CGRect.zero);
        label.backgroundColor = color
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.orange.cgColor
        label.numberOfLines = 0
        
        if(color == UIColor.black) {
            label.textColor = UIColor.white
        }
        
        var colorString = String(describing: color.self)
        colorString = colorString.replacingOccurrences(of: "UIExtendedGrayColorSpace", with: "->Gray:")
        colorString = colorString.replacingOccurrences(of: "UIExtendedSRGBColorSpace", with: "->SRGB:")
        
        //如果Label的width太小不足于撑开到ScrollView本身的View的width，就不能滚动
        label.text = text! + colorString //+ "dsfs第三方水电费水电费的身份是淡粉色的丰富的水分的水分饿会sdfsdf 水电费水电费发光的风格发大发过奋斗过奋斗过过对方的水分是的风多个"
        
        
       
        
        self.scrollView.addSubview(label)
        
        // 使用subView的变数名称取得它在UIView中的索引值（index）
        let index = self.scrollView.subviews.firstIndex(of: label)
        debugPrint("self.scrollView.subviews.firstIndex(of: label)= \(index!)")
        
        let indexValue = index! - 2
        let top = indexValue * 50
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self.scrollView).offset(20)
            //make.right.equalTo(self.scrollView).offset(-20) //如果Label的width太小不足于撑开到ScrollView本身的View的width，就不能滚动
            //
            make.centerX.equalTo(self.scrollView)
            make.top.equalTo(self.scrollView).offset(top)
        }
        
        debugPrint("self.scrollView.contentSize.width = \(self.scrollView.contentSize.width)")
    }
    
    /// 反射
    private func demoMirror() {
        let mi = Mirror(reflecting: UIColor.init())
        debugPrint("对象类型：\(mi.subjectType)")
        debugPrint("对象子元素个数：\(mi.children.count)")
        
        debugPrint("--- 对象子元素的属性名和属性值分别如下 ---")
        for case let (label?, value) in mi.children {
            debugPrint("-----属性：\(label), 值：\(value)")
        }
    }
    
    
}


