//
//  DefineTableView.swift
//  Attribute
//
//  Created by Fairy on 2018/11/9.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

// MARK: - 自定义UITableView的数据源
protocol DefineCellDataSource {
    var title: String { get }
}




// MARK: - 自定义UITableView
final class DefineTableView<T: DefineCellDataSource> : UITableView {
    private var temDataSource: [T]
    
    
    /// 指定构造器必须调用它最近父类的指定构造器.
    /// [Designated Initializer 指定构造器]
    /// - Parameter dataSource: 数据源
    init(dataSource: [T]) {
        self.temDataSource = dataSource
        //super.init(frame: CGRect.zero) // 这个构造器是UIView的，不是UITableView的，结果会报错
        super.init(frame: CGRect.zero, style: UITableView.Style.plain)
        
        // 设置预估行高 --> 先让 tableView 能滚动，在滚动的时候再去计算显示的 cell 的真正的行高，并且调整 tabelView 的滚动范围
        self.estimatedRowHeight = 300
        self.rowHeight = 300
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}



// MARK: - 使用自定义UITableView
final class DefineCellDataSourceDemo: DefineCellDataSource {
    var title: String = ""
    
}
// MARK: - 使用自定义UITableView
final class UseDefineTableView: UIViewController {
    
    /// 使用自定义UITableView
    private func designatedInit() {
        let define = DefineTableView<DefineCellDataSourceDemo>(dataSource: [])
        self.view.addSubview(define)
    }
}
