 
 //
 //  GestureHomeController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 internal final class GestureHomeCourseCellDataSource: IFtableViewDataSouce {
       
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "各种手势": {(target, indexPath, rowKey) -> Void in
                let proxy = UseGestureController()
                
                let tar = target as! GestureHomeController
                tar.show(proxy, sender: nil)
            }
        ],
        [
            "轻点手势": {(target, indexPath, rowKey) -> Void in
                //轻点手势识别UITapGestureRecognizer
                let view = UseTapGestureRecognizerController()
                
                let tar = target as! GestureHomeController
                tar.show(view, sender: nil)
            }
        ],
        [
            "长按手势": {(target, indexPath, rowKey) -> Void in
                //长按手势识别UILongPressGestureRecognizer
            }
        ],
        [
            "屏幕边缘拖动手势": {(target, indexPath, rowKey) -> Void in
                //屏幕边缘拖动手势识别UIScreenEdgePanGestureRecognizer
            }
        ],
        [
            "拖动手势": {(target, indexPath, rowKey) -> Void in
                //拖动手势识别UIPanGestureRecognizer
            }
        ],
        [
            "轻扫手势": {(target, indexPath, rowKey) -> Void in
                //轻扫手势识别UISwipeGestureRecognizer
            }
        ],
        [
            "旋转手势": {(target, indexPath, rowKey) -> Void in
                //旋转手势识别UIRotationGestureRecognizer
            }
        ],
        [
            "捏合手势": {(target, indexPath, rowKey) -> Void in
                //捏合手势识别对象UIPinchGestureRecognizer
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
    
 }
 
 
 
 // MARK: - 手势GestureHomeController
 internal final class GestureHomeController: UIViewController, IController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    
    
    private lazy var myTable: FtableView! = {
        let data = GestureHomeCourseCellDataSource()
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
 
