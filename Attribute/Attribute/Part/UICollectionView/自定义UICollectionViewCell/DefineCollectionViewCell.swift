//
//  DefineCollectionViewCell.swift
//  Attribute
//
//  Created by Fairy on 2018/11/27.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


/// 自定义UICollectionViewCell
final class DefineCollectionViewCell: UICollectionViewCell {
    
    public lazy var myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.magenta
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.orange
        view.layer.borderColor = UIColor.cyan.cgColor
        view.layer.borderWidth = 1.0
        view.image = UIImage(named: "apple.jpg")?.withRenderingMode(.alwaysOriginal)
        
        return view
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        
        debugPrint("self.superview as Any = ")
        debugPrint(self.superview as Any)
        
        debugPrint("self.backgroundView ?? Any.self")
        debugPrint(self.backgroundView ?? Any.self)
        debugPrint("self.contentView ?? Any.self")
        debugPrint(self.contentView)
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.red
        self.contentView.backgroundColor = UIColor.brown
        
        self.addSubview(self.myImageView)
        self.myImageView.snp.makeConstraints { (make) in
            make.width.equalTo(self).offset(-10)
            make.height.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        self.addSubview(self.myLabel)
        self.myLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.centerX.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
