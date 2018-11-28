//
//  DefineCollectionHeaderView.swift
//  Attribute
//
//  Created by Fairy on 2018/11/28.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class DefineCollectionHeaderView : UICollectionReusableView {
    
    public lazy var myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.gray
        label.textAlignment = .center
        label.text = String(describing: DefineCollectionHeaderView.self)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
        
        debugPrint("DefineCollectionHeaderView.frame = \(frame)")
        
        self.addSubview(self.myLabel)
        self.myLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self).offset(-20)
            make.height.equalTo(self).offset(-20)
            make.center.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
