//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit
 
/// HomeController
internal final class HomeController: UIViewController {
    
    internal   let _ui = "UI"
    internal   let _dialog = "Dialog"
    internal   let _animation = "动画"
    internal   let _kit = "Kit"
    internal   let _swift = "Swift"
    internal   let _thread = "线程"
    
    //--UI--
    internal   let _uiUnit: String = "小部件"
    internal   let _uiUITableView: String = "UITableView"
    internal   let _uiUITabBar: String = "UITabBar"
    internal   let _uiNavigation: String = "Navigation"
    //--Dialog--
    internal   let _dialogDialog1: String = "Dialog1"
    //--动画--
    internal   let _animationAnimation1: String = "Animation1"
    //--Kit--
    internal   let _kitSnapKit: String = "SnapKit"
    //--Swift--
    internal   let _swiftSwift1: String = "Swift1"
    //--Thread--
    internal   let _threadThread1: String = "Thread1"
    
    private lazy var myTable: CourseTableView! = {
        
        
        let sections = [_ui, _dialog, _animation, _kit, _swift, _thread]
        let rows = [
            [_uiUnit, _uiUITableView, _uiUITabBar, _uiNavigation],
            [_dialogDialog1],
            [_animationAnimation1],
            [_kitSnapKit],
            [_swiftSwift1],
            [_threadThread1]
        ]
        let actions: Dictionary<String, ((IndexPath) -> Void)?> = [
            _uiUnit: {(indexPath) -> Void in
                let unitController = UnitHomeController()
                self.show(unitController, sender: nil)
            },
            _uiUITableView: {(indexPath) -> Void in
                let homeTable = TableHomeController()
                self.show(homeTable, sender: nil)
            },
            _uiUITabBar: {(indexPath) -> Void in
                
            },
            _uiNavigation: {(indexPath) -> Void in
                let homeNavigation = NavigationHomeController()
                self.show(homeNavigation, sender: nil)
            },
            _dialogDialog1: {(indexPath) -> Void in
                
            },
            _animationAnimation1: {(indexPath) -> Void in
                
            },
            _kitSnapKit: {(indexPath) -> Void in
                
            },
            _swiftSwift1: {(indexPath) -> Void in
                let homeTable = SwiftHomeController()
                self.show(homeTable, sender: nil)
            },
            _threadThread1: {(indexPath) -> Void in
                let homeTable = ThreadHomeController()
                self.show(homeTable, sender: nil)
            },
        ]
        
        let table = CourseTableView(sections: sections, rows: rows, actions: actions)
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
