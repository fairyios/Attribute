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
    
    private let reuseCellName = String(describing: DefineCollectionViewCell.self)
    private let forSupplementaryViewOfKindHeader = UICollectionView.elementKindSectionHeader
    private let forSupplementaryViewOfKindFooter = UICollectionView.elementKindSectionFooter
    
    private lazy var myCollectionView: UICollectionView! = {
        
        let width  = screenWidth - 40
        let height = screenHeight - 40
        
        let flow = UICollectionViewFlowLayout.init()
        flow.itemSize = CGSize(width: 150.0, height: 150.0)
        flow.minimumLineSpacing = 10//网格中项目行之间使用的最小间距。
        flow.minimumInteritemSpacing = 10//在同一行中的项目之间使用的最小间距。
        flow.scrollDirection = .vertical
        //边距用于在一个部分中布置内容
        flow.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        // 设置分区头视图和尾视图宽高
        flow.headerReferenceSize = CGSize(width: width, height: 80)
        flow.footerReferenceSize = CGSize(width: width, height: 80)
        
        
        
        let frame = CGRect(x: 20, y: 20, width: width, height: height)
        var collection = UICollectionView(frame: frame, collectionViewLayout: flow)
        collection.backgroundColor = UIColor.purple
        collection.delegate = self
        collection.dataSource = self
        // 注册cell
        collection.register(DefineCollectionViewCell.self, forCellWithReuseIdentifier: reuseCellName)
        // 注册headerView
        //collection.register(UIView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: forSupplementaryViewOfKindHeader)
        // 注册footView
        //collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: forSupplementaryViewOfKindFooter)
        
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
        let cellReuse = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCellName, for: indexPath)
        let cell = cellReuse as! DefineCollectionViewCell
        cell.myLabel.text = "第\(indexPath.row)行"
        return cell
    }
    
    
}
