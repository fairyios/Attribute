//
//  DefineUILabel.swift
//  Attribute
//
//  Created by Fairy on 2018/11/10.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class DefineUILabel: UILabel {
    override func drawText(in rect: CGRect) {
        //https://cloud.tencent.com/developer/ask/150777
        
        
        // 返回当前图形上下文。
        let context = UIGraphicsGetCurrentContext()
        //设置图形上下文的线宽。
        context?.setLineWidth(10)
        //设置图形上下文中连接线的连接样式。
        context?.setLineJoin(CGLineJoin.round)
        //设置当前文本绘制模式。.stroke:对文本执行笔划操作
        context?.setTextDrawingMode(.stroke)
        self.textColor = UIColor.white
        super.drawText(in: rect)
    }
}
