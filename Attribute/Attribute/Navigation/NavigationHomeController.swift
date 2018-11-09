 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 internal final class NavigationHomeCourseCellDataSource: ICourseCellDataSource {
    
    internal static let firstSystem = "导航栏"
    
    //--UI--
    internal static let secondSystem: String = "系统导航栏"
    internal static let secondDefine: String = "自定义导航栏"
    
    var sections: [String] = [firstSystem]
    
    var rows: [[String]] = [
        [
            secondSystem, secondDefine
        ]
    ]
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [
        secondSystem: {(target, indexPath) -> Void in
            let system = NavigationSystemController()
            let systemNavigation = UINavigationController(rootViewController: system)
            target.present(systemNavigation, animated: true, completion: nil)
        },
        secondDefine: {(target, indexPath) -> Void in
            //let define = NavigationSelfViewController()
            //let defineNavigation = NavigationSelfController(rootViewController: define)
            let defineNavigation = NavigationSelfController()
            target.present(defineNavigation, animated: true, completion: nil)
        },
        ]
    
    
 }
 
 /// NavigationHomeController
 internal final class NavigationHomeController: UIViewController, UINavigationControllerDelegate {
    
    private lazy var myTable: CourseTableView! = {
        let data = NavigationHomeCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = HomeCourseCellDataSource.rowUINavigation
        self.view.backgroundColor = UIColor.orange
        
        debugPrint("self.navigationController ?? Any.self")
        debugPrint(self.navigationController ?? Any.self)
        debugPrint("self.navigationController?.navigationBar ?? Any.self")
        debugPrint(self.navigationController?.navigationBar ?? Any.self)
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
 }
  
