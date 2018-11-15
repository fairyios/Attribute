 
 //
 //  GestureHomeController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 internal final class GestureDataSource: IFtableViewDataSouce {
       
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "各种手势": {(target, indexPath, rowKey) -> Void in
                let proxy = UseGestureController()
                
                let tar = target as! GestureController
                tar.show(proxy, sender: nil)
            }
        ],
        [
            "轻点手势": {(target, indexPath, rowKey) -> Void in
                //轻点手势识别UITapGestureRecognizer
                let dataSource = TapGestureRecognizerDataSource()
                let view = TapGestureRecognizerController(title: rowKey, source: dataSource)
                
                let tar = target as! GestureController
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
 
 
 
 // MARK: - 手势GestureController
 internal final class GestureController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
 }
 
