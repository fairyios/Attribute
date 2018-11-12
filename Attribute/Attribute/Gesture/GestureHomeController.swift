 
 //
 //  GestureHomeController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 internal final class GestureHomeCourseCellDataSource: ICourseCellDataSource {
    
    internal static let sectionGesture = "手势"
    internal static let sectionUIGestureRecognizer = "手势识别UIGestureRecognizer"
    
    //--sectionGesture--
    internal static let rowGesture1: String = "手势 1"
    
    //--sectionUIGestureRecognizer--
    
    /// 轻点手势识别
    internal static let rowUITapGestureRecognizer: String = "轻点手势识别UITapGestureRecognizer"
    /// 捏合手势识别对象
    internal static let rowUIPinchGestureRecognizer: String = "捏合手势识别对象UIPinchGestureRecognizer"
    /// 旋转手势识别
    internal static let rowUIRotationGestureRecognizer: String = "旋转手势识别UIRotationGestureRecognizer"
    /// 轻扫手势识别
    internal static let rowUISwipeGestureRecognizer: String = "轻扫手势识别UISwipeGestureRecognizer"
    /// 拖动手势识别
    internal static let rowUIPanGestureRecognizer: String = "拖动手势识别UIPanGestureRecognizer"
    /// 屏幕边缘拖动手势识别
    internal static let rowUIScreenEdgePanGestureRecognizer: String = "屏幕边缘拖动手势识别UIScreenEdgePanGestureRecognizer"
    /// 长按手势识别
    internal static let rowUILongPressGestureRecognizer: String = "长按手势识别UILongPressGestureRecognizer"
    
    
    var sections: [String] = [sectionGesture, sectionUIGestureRecognizer]
    
    var rows: [[String]] = [
        [
            rowGesture1
        ],
        //--sectionUIGestureRecognizer--
        [
            rowUITapGestureRecognizer, rowUIPinchGestureRecognizer,
            rowUIRotationGestureRecognizer, rowUISwipeGestureRecognizer,
            rowUIPanGestureRecognizer, rowUIScreenEdgePanGestureRecognizer,
            rowUILongPressGestureRecognizer
        ]
    ]
    var actions: Dictionary<String, ((UIViewController, IndexPath) -> Void)?> = [
        rowGesture1: {(target, indexPath) -> Void in
            
        },
        rowUITapGestureRecognizer: {(target, indexPath) -> Void in
            //轻点手势识别UITapGestureRecognizer
            let view = UseTapGestureRecognizerController()
           
            let tar = target as! GestureHomeController
            tar.show(view, sender: nil)
        },
        rowUIPinchGestureRecognizer: {(target, indexPath) -> Void in
            //捏合手势识别对象UIPinchGestureRecognizer
        },
        rowUIRotationGestureRecognizer: {(target, indexPath) -> Void in
            //旋转手势识别UIRotationGestureRecognizer
        },
        rowUISwipeGestureRecognizer: {(target, indexPath) -> Void in
            //轻扫手势识别UISwipeGestureRecognizer
        },
        rowUIPanGestureRecognizer: {(target, indexPath) -> Void in
            //拖动手势识别UIPanGestureRecognizer
        },
        rowUIScreenEdgePanGestureRecognizer: {(target, indexPath) -> Void in
            //屏幕边缘拖动手势识别UIScreenEdgePanGestureRecognizer
        },
        rowUILongPressGestureRecognizer: {(target, indexPath) -> Void in
            //长按手势识别UILongPressGestureRecognizer
        },
    ]
    
    
 }
 
 
 protocol IGestureHomeController {
    /// row1_1:
    func row1_1_action()
    
    /// row1_2:
    func row1_2_action()
    
    /// row2_1:
    func row2_1_action()
 }
 
 extension GestureHomeController: IGestureHomeController {
    /// row1_1:
    func row1_1_action() {
        
    }
    
    /// row1_2:
    func row1_2_action() {
        
    }
    
    /// row2_1:
    func row2_1_action() {
        
    }
    
    
 }
 
 // MARK: - 手势GestureHomeController
 internal final class GestureHomeController: UIViewController {
    
    private lazy var myTable: CourseTableView! = {
        let data = GestureHomeCourseCellDataSource()
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
 
