//
//  UITableViewTypeCell.swift
//  Attribute
//
//  Created by Fairy on 2018/11/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

internal protocol IUITableViewTypeCell {
    var cellClass: AnyClass { get set}
}

internal class UITableViewTypeCell<T: Any> : UITableViewCell,IUITableViewTypeCell  {
    
    
    //var reuseIdentifier: String = NSStringFromClass(UITableViewTypeCell.self)
    var cellClass: AnyClass = UITableViewTypeCell.self
    
    convenience init() {
        self.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class a {
    init() {
        _ = UITableViewTypeCell<String>()
    }
}
