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
    
    private let identityCollectionViewCell = String(describing: DefineCollectionViewCell.self)
    private let identityCollectionHeaderView = String(describing: DefineCollectionHeaderView.self)
    private let identityCollectionFooterView = String(describing: DefineCollectionFooterView.self)
    
    private lazy var myCollectionView: UICollectionView! = {
        
        let width  = screenWidth - 40
        let height = screenHeight - 40
        let spance: Double = 10
        let left: Double = 10
        let right: Double = 10
        let itemSizeWidth: Double = (Double(width) - (spance * 2) - left - right) / 3
        
        let flow = UICollectionViewFlowLayout.init()
        flow.itemSize = CGSize(width: itemSizeWidth, height: itemSizeWidth)
        flow.minimumLineSpacing = CGFloat(spance)//设置行间距(最小)
        flow.minimumInteritemSpacing = CGFloat(spance)//设置列间距(最小)
        flow.scrollDirection = .vertical//设置滚动方向
        //设置分区缩进量：边距用于在一个部分中布置内容
        flow.sectionInset = UIEdgeInsets.init(top: 10, left: CGFloat(left), bottom: 10, right: CGFloat(right))
        // 设置分区头视图和尾视图宽高
        flow.headerReferenceSize = CGSize(width: width, height: 80)
        flow.footerReferenceSize = CGSize(width: width, height: 80)
        
        
        
        let frame = CGRect(x: 20, y: 20, width: width, height: height)
        var collection = UICollectionView(frame: frame, collectionViewLayout: flow)
        collection.backgroundColor = UIColor.purple
        collection.delegate = self
        collection.dataSource = self
        // 注册cell
        collection.register(DefineCollectionViewCell.self, forCellWithReuseIdentifier: identityCollectionViewCell)
        // 注册区头【附加这个才能生效：func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {}】
        collection.register(DefineCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identityCollectionHeaderView)
        // 注册区尾【附加这个才能生效：func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {}】
        collection.register(DefineCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identityCollectionFooterView)
        
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
    
    
    /// 告诉委托者指定了指定索引路径的项目。
    /// Tells the delegate that the item at the specified index path was selected.
    /// - Parameters:
    ///   - collectionView: <#collectionView description#>
    ///   - indexPath: <#indexPath description#>
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cellReuse = collectionView.dequeueReusableCell(withReuseIdentifier: identityCollectionViewCell, for: indexPath)
        let cell = cellReuse as! DefineCollectionViewCell
        cell.myLabel.text = "被选中了"
        
        //Selects the item at the specified index path and optionally scrolls it into view.
        //选择指定索引路径处的项目，并可选择将其滚动到视图中
        //collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.bottom)
    }
}


// MARK: - UICollectionViewDataSource
extension UseCollectionViewController: UICollectionViewDataSource {
    
    
    /// 返回UICollectionView有多少个分区
    ///
    /// - Parameter collectionView: collectionView description
    /// - Returns: return value description
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    /// 返回一个分区有多少个Item (多少条)
    ///
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - section: section description
    /// - Returns: return value description
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    
    /// 返回UICollectionViewCell视图
    ///
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellReuse = collectionView.dequeueReusableCell(withReuseIdentifier: identityCollectionViewCell, for: indexPath)
        let cell = cellReuse as! DefineCollectionViewCell
        cell.myLabel.text = "第\(indexPath.row)行"
        return cell
    }
    
    
    /// 返回区头区尾视图的代理方法：让 “注册区头” 和 “注册区尾” 生效
    ///
    /// - Parameters:
    ///   - collectionView: collectionView description
    ///   - kind: kind description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            //返回区头视图
            let headerViewReusable = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identityCollectionHeaderView, for: indexPath)
            let headerView = headerViewReusable as! DefineCollectionHeaderView
            
            
            return headerView
        }
        else if kind == UICollectionView.elementKindSectionFooter {
            //返回区尾视图
            let footerViewReusable = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identityCollectionFooterView, for: indexPath)
            let footerView = footerViewReusable as! DefineCollectionFooterView
            
            
            return footerView
        }
        //throw Error()
        return UICollectionReusableView()
    }
    
}
