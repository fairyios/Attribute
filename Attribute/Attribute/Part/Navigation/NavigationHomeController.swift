 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 internal final class NavigationHomeCourseCellDataSource: IFtableViewDataSouce {
     
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "系统导航栏": {(target, indexPath, rowKey) -> Void in
                let system = NavigationSystemController(title: rowKey)
                let systemNavigation = UINavigationController(rootViewController: system)
                target.present(systemNavigation, animated: true, completion: nil)
            }
        ],
        [
            "自定义导航栏": {(target, indexPath, rowKey) -> Void in
                //let define = NavigationSelfViewController()
                //let defineNavigation = NavigationSelfController(rootViewController: define)
                let defineNavigation = NavigationSelfController(title: rowKey)
                target.present(defineNavigation, animated: true, completion: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
 }
 
 /// NavigationHomeController
 internal final class NavigationHomeController: UIViewController, IController,
    UINavigationControllerDelegate  {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    private lazy var myTable: FtableView! = {
        let data = NavigationHomeCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navigationTitle
        self.view.backgroundColor = UIColor.orange
        
        debugPrint("self.navigationController ?? Any.self")
        debugPrint(self.navigationController ?? Any.self)
        debugPrint("self.navigationController?.navigationBar ?? Any.self")
        debugPrint(self.navigationController?.navigationBar ?? Any.self)
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
    }
    
    
 }
  
