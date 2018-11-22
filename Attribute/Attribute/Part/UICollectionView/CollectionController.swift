//
//  CollectionController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/22.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


final class CollectionDataSource : IFtableViewDataSouce {
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "": {(target, indexPath, rowKey) -> Void in
                let this = target as! CollectionController
                
                let view = UICollectionViewController()
                this.present(view, animated: true, completion: nil)
            }
        ],
    ]
}

final class CollectionController: FtableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


