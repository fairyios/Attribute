//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal final class HomeCourseCellDataSource: ICourseCellDataSource {
    
    
    internal static    let _ui = "UI"
    internal  static let _dialog = "Dialog"
    internal static  let _animation = "动画"
    internal  static let _kit = "Kit"
    internal static  let _swift = "Swift"
    internal static  let _thread = "线程"
    internal static let _visualEffect = "虚拟特效"
    internal static let _iosDiffrent = "IOS系统版本差异"
    internal static let _pit = "踩坑"
    
    //--UI--
    internal  static let _uiUnit: String = "小部件"
    internal  static let _uiUITableView: String = "UITableView"
    internal static  let _uiUITabBar: String = "UITabBar"
    internal static  let _uiNavigation: String = "导航栏"
    //--Dialog--
    internal  static let _dialogDialog1: String = "Dialog1"
    //--动画--
    internal  static let _animationAnimation1: String = "Animation1"
    //--Kit--
    internal  static let _kitSnapKit: String = "SnapKit"
    //--Swift--
    internal  static let _swiftSwift1: String = "Swift1"
    //--Thread--
    internal  static let _threadThread1: String = "Thread1"
    //--VisualEffect--
    internal static let _visualEffectUIBlurEffect: String = "UIBlurEffect"
    //--_iosDiffrent--
    internal static let _iosDiffrentD1 = "IOS系统版本差异 1"
    //--_pit--
     internal static let _pitPit1 = "踩坑 1"
    
    var sections: [String] = [_ui, _dialog, _animation, _kit, _swift, _thread,
                              _visualEffect, _iosDiffrent, _pit
                              ]
    
    var rows: [[String]] = [
        [_uiUnit, _uiUITableView, _uiUITabBar, _uiNavigation],
        [_dialogDialog1],
        [_animationAnimation1],
        [_kitSnapKit],
        [_swiftSwift1],
        [_threadThread1],
        [_visualEffectUIBlurEffect],
        [_iosDiffrentD1],
        [_pitPit1]
    ]
    
    var actions: Dictionary<String, ((UIViewController,IndexPath) -> Void)?> = [
        _uiUnit: {(target, indexPath) -> Void in
            let unitController = UnitHomeController()
            target.show(unitController, sender: nil)
        },
        _uiUITableView: {(target, indexPath) -> Void in
            let homeTable = TableHomeController()
            target.show(homeTable, sender: nil)
        },
        _uiUITabBar: {(target, indexPath) -> Void in
            
        },
        _uiNavigation: {(target, indexPath) -> Void in
            let homeNavigation = NavigationHomeController()
            target.show(homeNavigation, sender: nil)
        },
        _dialogDialog1: {(target, indexPath) -> Void in
            
        },
        _animationAnimation1: {(target, indexPath) -> Void in
            
        },
        _kitSnapKit: {(target, indexPath) -> Void in
            
        },
        _swiftSwift1: {(target, indexPath) -> Void in
            let homeTable = SwiftHomeController()
            target.show(homeTable, sender: nil)
        },
        _threadThread1: {(target, indexPath) -> Void in
            let homeTable = ThreadHomeController()
            target.show(homeTable, sender: nil)
        },
        _visualEffectUIBlurEffect: {(target, indexPath) -> Void in
            
        },
    ]
    
    
}

/// HomeController
internal final class HomeController: UIViewController {
    
    private lazy var myTable: CourseTableView! = {
        let data = HomeCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Attribute"
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
