//
//  UseCollectionViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/26.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

let screenWidth: CGFloat = UIScreen.main.bounds.width
let screenHeight: CGFloat = UIScreen.main.bounds.height

/// 使用UICollectionView
final class UseCollectionViewController: UIViewController {
    
    private var reuseCellName = String(describing: UICollectionViewCell.self)
    
    private lazy var myCollectionView: UICollectionView! = {
        
        let flow = UICollectionViewFlowLayout.init()
        flow.itemSize = CGSize(width: 60.0, height: 60.0)
        flow.minimumLineSpacing = 8//网格中项目行之间使用的最小间距。
        flow.minimumInteritemSpacing = 8//在同一行中的项目之间使用的最小间距。
        flow.scrollDirection = .vertical
        //边距用于在一个部分中布置内容
        flow.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        
        
        let frame = CGRect(x: 0, y: 0, width: screenWidth - 40, height: screenHeight - 40)
        var collection = UICollectionView(frame: frame, collectionViewLayout: flow)
        collection.backgroundColor = UIColor.purple
        collection.delegate = self
        collection.dataSource = self 
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseCellName)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(self.myCollectionView)
    }
}


// MARK: - UICollectionViewDelegate
extension UseCollectionViewController: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDataSource
extension UseCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuse = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellName, for: indexPath)
        
        debugPrint("reuse.backgroundView ?? Any.self")
        debugPrint(reuse.backgroundView ?? Any.self)
        debugPrint("reuse.contentView ?? Any.self")
        debugPrint(reuse.contentView)
        
        reuse.backgroundView = UIView()
        reuse.backgroundView?.backgroundColor = UIColor.red
        reuse.contentView.backgroundColor = UIColor.brown
        
        
        return reuse
    }
    
    
}
