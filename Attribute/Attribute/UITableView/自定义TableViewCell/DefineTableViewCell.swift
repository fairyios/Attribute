//
//  UITableViewTypeCell.swift
//  Attribute
//
//  Created by Fairy on 2018/11/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


internal class DefineTableViewCell : UITableViewCell  {
    
    internal static let defineRowHeight: CGFloat = CGFloat(400)
    
    lazy var myContentView: UIView! = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.white
        contentView.layer.cornerRadius = 20
        //contentView.clipsToBounds = true
        
        contentView.layer.borderWidth = CGFloat(1.0)
        contentView.layer.borderColor = UIColor.orange.cgColor
        contentView.layer.shadowColor = UIColor.orange.cgColor// ColorDefault.Theme.cgColor// UIColor.red.cgColor
        contentView.layer.shadowRadius = CGFloat(15)
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        //contentView.layer.shadowPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 5).cgPath
        //contentView.layer.contents = UIScreen.main.scale
        
        
        return contentView
    }()
    
    /// 图片【UIImageView 设置圆角“imageView.clipsToBounds = true”后阴影效果会消失】
    lazy var myImageView: UIImageView! = {
        let imageView = UIImageView(image: UIImage(named: "huaqiangu_logo_600x600iPhoneXPortraitiOS11_375x812pt"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = CGFloat(20)
        imageView.clipsToBounds = true//设置为true，阴影失效
        
        return imageView
    }()
    
    lazy var myEffect: UIVisualEffectView! = {
        let blur = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let effect = UIVisualEffectView(effect: blur)
        effect.translatesAutoresizingMaskIntoConstraints = false
        effect.backgroundColor = UIColor.clear// ColorDefault.Theme
        effect.layer.cornerRadius = CGFloat(20)
        effect.clipsToBounds = true
        //effect.textColor = UIColor.red
        //effect.frame.size.width = CGFloat(50)
        //effect.frame.size.height = CGFloat(50)
        
        return effect
    }()
    
    lazy var myLabelInEffect: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear// ColorDefault.Theme
        label.layer.cornerRadius = CGFloat(20)
        label.clipsToBounds = true
        //label.textColor = UIColor.red
        //label.frame.size.width = CGFloat(50)
        //label.frame.size.height = CGFloat(50)
        label.text = "花v千骨vv花v千骨vv"
        label.textAlignment  = .center
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.gray
//        self不能设置snp，否则会看不cell
//        self.snp.makeConstraints { (make) in
//            make.height.equalTo(500)
//        }
        
        self.addSubview(self.myContentView)
        self.myContentView.snp.makeConstraints({ (make) in
            make.width.equalTo(300)
            make.height.equalTo(self).offset(-40)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        })
 
        self.myContentView.addSubview(self.myImageView)
        self.myImageView.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.myContentView)
        })
        
        self.myContentView.addSubview(self.myEffect)
        self.myEffect.snp.makeConstraints({ (make) in
            make.width.equalTo(self.myContentView)
            make.height.equalTo(CGFloat(50))
            make.bottom.equalTo(self.myContentView)
            make.centerX.equalTo(self.myContentView)
            
        })
        
        self.myEffect.contentView.addSubview(self.myLabelInEffect)
        self.myLabelInEffect.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.myEffect.contentView)
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


