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
    
    internal static let sectionUI = "UI"
    internal static let sectionDialog = "Dialog"
    internal static let sectionAnimation = "动画"
    internal static let sectionGesture = "手势"
    internal static let sectionKit = "第三方"
    internal static let sectionSwift = "Swift"
    internal static let sectionThread = "线程"
    internal static let sectionVisualEffect = "虚拟特效"
    internal static let sectionIosDiffrent = "IOS系统版本差异"
    internal static let sectionPit = "踩坑"
    
    //--UI--
    internal static let rowUIUnit: String = "小部件"
    internal static let rowUIUITableView: String = "UITableView"
    internal static let rowUIUITabBar: String = "UITabBar"
    internal static let rowUINavigation: String = "导航栏"
    //--Dialog--
    internal static let rowDialogDialog1: String = "Dialog1"
    //--动画--
    internal static let rowAnimation1: String = "Animation1"
    //--_gesture--
    internal static let rowGesture1 = "手势1"
    //--Kit--
    internal static let rowKitSnapKit: String = "SnapKit"
    //--Swift--
    internal static let rowSwift1: String = "Swift1"
    //--Thread--
    internal static let rowThread1: String = "Thread1"
    //--VisualEffect--
    internal static let rowEffectUIBlurEffect: String = "UIBlurEffect"
    //--_iosDiffrent--
    internal static let rowIosDiffrentD1 = "IOS系统版本差异 1"
    //--_pit--
    internal static let rowPitPit1 = "踩坑 1"
    
    var sections: [String] = [
        sectionUI, sectionDialog, sectionAnimation,
        sectionGesture, sectionKit, sectionSwift,
        sectionThread, sectionVisualEffect,
        sectionIosDiffrent, sectionPit
    ]
    
    var rows: [[String]] = [
        [rowUIUnit, rowUIUITableView, rowUIUITabBar, rowUINavigation],
        [rowDialogDialog1],
        [rowAnimation1],
        [rowGesture1],
        [rowKitSnapKit],
        [rowSwift1],
        [rowThread1],
        [rowEffectUIBlurEffect],
        [rowIosDiffrentD1],
        [rowPitPit1]
    ]
    
    var actions: Dictionary<String, ((UIViewController,IndexPath) -> Void)?> = [
        rowUIUnit: {(target, indexPath) -> Void in
            let unitController = UnitHomeController()
            target.show(unitController, sender: nil)
        },
        rowUIUITableView: {(target, indexPath) -> Void in
            let homeTable = TableHomeController()
            target.show(homeTable, sender: nil)
        },
        rowUIUITabBar: {(target, indexPath) -> Void in
            
        },
        rowUINavigation: {(target, indexPath) -> Void in
            let homeNavigation = NavigationHomeController()
            target.show(homeNavigation, sender: nil)
        },
        rowDialogDialog1: {(target, indexPath) -> Void in
            
        },
        rowAnimation1: {(target, indexPath) -> Void in
            
        },
        rowGesture1: {(target, indexPath) -> Void in
            
        },
        rowKitSnapKit: {(target, indexPath) -> Void in
            
        },
        rowSwift1: {(target, indexPath) -> Void in
            let homeTable = SwiftHomeController()
            target.show(homeTable, sender: nil)
        },
        rowThread1: {(target, indexPath) -> Void in
            let homeTable = ThreadHomeController()
            target.show(homeTable, sender: nil)
        },
        rowEffectUIBlurEffect: {(target, indexPath) -> Void in
            
        },
        rowIosDiffrentD1: {(target, indexPath) -> Void in
            
        },
        rowPitPit1: {(target, indexPath) -> Void in
        
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
