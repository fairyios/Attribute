//
//  SwiftInitController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/9.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class SwiftInitController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Designated Initializer 指定构造器
    //Convenience Initializer 便利初始化器
    
    
}



// MARK: - 指定构造器必须调用它最近父类的指定构造器.
// MARK: - 自定义UITableView
final class SwiftInitTableView<T: NSObject> : UITableView {
    private var temDataSource: [T]
    
    /// 指定构造器必须调用它最近父类的指定构造器.
    /// []
    /// - Parameter dataSource: 数据源
    init(dataSource: [T]) {
        self.temDataSource = dataSource
        //super.init(frame: CGRect.zero) // 这个构造器是UIView的，不是UITableView的，结果会报错
        super.init(frame: CGRect.zero, style: UITableView.Style.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
