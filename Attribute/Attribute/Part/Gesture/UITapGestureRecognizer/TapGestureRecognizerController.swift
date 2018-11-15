


//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


 
// MARK: - TapGestureRecognizerDataSource
internal final class TapGestureRecognizerDataSource: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "用于键盘回收": {(target, indexPath, rowKey) -> Void in
                let con = target as! TapGestureRecognizerController
                con.row1_1_action(con: target, indexPath: indexPath)
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
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
}

extension TapGestureRecognizerController {
    /// row1_1:常用轻点手势 常用于键盘回收，事件一次性响应等操作
    public func row1_1_action(con: UIViewController, indexPath: IndexPath) {
        
        let new = UIViewController()
        new.view.backgroundColor = UIColor.gray
        
        let text = UITextField()
        text.backgroundColor = UIColor.white
        text.placeholder = "请输入文字"
        new.view.addSubview(text)
        text.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(new.view.snp.centerX)
            make.centerY.equalTo(new.view.snp.centerY)
        }
        
        let tapGesture = UITapGestureRecognizer.init()
        tapGesture.numberOfTouchesRequired = 1  //手指个数
        tapGesture.numberOfTapsRequired = 1 //轻点次数
        tapGesture.addTarget(self, action: #selector(self.row1_1_action_tapAction(action:text:)))
        new.view.addGestureRecognizer(tapGesture)
        
        
        
        self.show(new, sender: nil)
    }
    /*轻点手势的方法*/
    @objc func row1_1_action_tapAction(action:UITapGestureRecognizer, text: UITextField) {
        
        print("常用轻点手势常用于键盘回收begin")
        
        //关闭键盘
        //text.resignFirstResponder()
        action.view?.endEditing(true)
        
        print("常用轻点手势常用于键盘回收end")
    }
    
    
}

internal final class TapGestureRecognizerController: FtableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
}

