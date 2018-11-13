


//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit







/// 使用UIGestureRecognizerDelegate
internal final class UseGestureRecognizerDelegateController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = GestureHomeCourseCellDataSource.rowGestureDelegate
        self.view.backgroundColor = UIColor.gray
        
        
        self.addTapView(top: Double(70.0))
        self.addPanView(top: Double(120.0))
        self.addLongView(top: Double(170.0))
        
        return
        
        
        
        //清扫手势:用于查找一个或多个方向的滑动手势。 ??????????????????????
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.numberOfTouchesRequired = 1 //手指数
        swipeGesture.delegate = self
        swipeGesture.addTarget(self, action: #selector(self.swipeAction(swipe:)))
        self.view.addGestureRecognizer(swipeGesture)
        
        //捏合手势识别器
        let pinchGesture = UIPinchGestureRecognizer()
        pinchGesture.delegate = self
        pinchGesture.addTarget(self, action: #selector(self.pinchAction(pinch:)))
        self.view.addGestureRecognizer(pinchGesture)
        
        //旋转手势识别器
        let rotationGesture = UIRotationGestureRecognizer()
        rotationGesture.delegate = self
        rotationGesture.addTarget(self, action: #selector(self.rotationAction(rotation:)))
        self.view.addGestureRecognizer(rotationGesture)
        
        //屏幕边缘拖动手势识别器
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer()
        screenEdgePanGesture.delegate = self
        screenEdgePanGesture.addTarget(self, action: #selector(self.screenEdgePanAction(screenEdgePan:)))
        self.view.addGestureRecognizer(screenEdgePanGesture)
    }
    
    
    /// 屏幕边缘拖动手势识别器
    ///
    /// - Parameter screenEdgePan: screenEdgePan description
    @objc func screenEdgePanAction(screenEdgePan: UIScreenEdgePanGestureRecognizer) {
        debugPrint("[#selector]屏幕边缘拖动手势识别器UIScreenEdgePanGestureRecognizer: ")
    }
    
    /// 旋转手势识别器
    ///
    /// - Parameter rotation: rotation description
    @objc func rotationAction(rotation: UIRotationGestureRecognizer) {
        
        debugPrint("[#selector]旋转手势识别器UIRotationGestureRecognizer: ")
    }
    
    
    /// 捏合手势识别器
    ///
    /// - Parameter pinch: pinch description
    @objc func pinchAction(pinch: UIPinchGestureRecognizer) {
        //let scale = pinch.scale
        ///let velocity = pinch.velocity
        debugPrint("[#selector]捏合手势识别器UIPinchGestureRecognizer: pinch.scale = \(pinch.scale), pinch.velocity = \(pinch.velocity)")
    }
    
    
    /// 清扫手势
    ///
    /// - Parameter swipe: swipe description
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        //swipe.direction = [UISwipeGestureRecognizer.Direction.right , .left]
        swipe.direction = [.right , .left, .up, .down]
        debugPrint("[#selector]清扫手势UISwipeGestureRecognizer: swipe.direction = \(swipe.direction)")
    }
    
    
    
    
    
    
    
}



// MARK: - 轻点手势
extension UseGestureRecognizerDelegateController {
    /// 轻点手势-单指单击手势
    private func addTapView(top: Double) {
        
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "轻点手势-单指单击手势"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //忽略用户事件并从事件队列中删除:手势事件才能执行
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(Double(40))
            make.top.equalTo(top)
        }
        
        //添加轻点手势
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.delegate = self
        tapGesture.addTarget(self, action: #selector(self.tapAction(tap:)))
        label.addGestureRecognizer(tapGesture)
    }
    
    /// 轻点手势
    ///
    /// - Parameter tap: tap description
    @objc func tapAction(tap: UITapGestureRecognizer) {
        let label = tap.view as! UILabel
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.white
        debugPrint("[#selector]轻点手势UITapGestureRecognizer:")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            label.backgroundColor = UIColor.orange
            label.text = "轻点手势-单指单击手势"
            label.textColor = UIColor.white
        }
    }
}

// MARK: - 拖拽手势
extension UseGestureRecognizerDelegateController {
    private func addPanView(top: Double) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "拖拽手势-"
        label.textAlignment = .center
        //label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //忽略用户事件并从事件队列中删除:手势事件才能执行
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(40)
            make.top.equalTo(top)
        }
        
        //添加拖拽手势
        let panGesture = UIPanGestureRecognizer.init()
        panGesture.minimumNumberOfTouches = 1  //手指个数 /*最大最小的手势触摸次数*/
        panGesture.maximumNumberOfTouches = 1 //手指个数 /*最大最小的手势触摸次数*/
        panGesture.delegate = self// 指定delegate后，实现的delegate才能执 行
        panGesture.addTarget(self, action: #selector(self.panAction(pan:)))
        label.addGestureRecognizer(panGesture)
        
        
    }
    
    /// 拖拽手势
    ///
    /// - Parameter pan: pan description
    @objc func panAction(pan: UIPanGestureRecognizer) {
        
        let label = pan.view as! UILabel
        let labelOrgin = label.frame.origin//label.frame.origin原点
        debugPrint("label.frame.origin = \(labelOrgin)")
        
        let location = pan.location(in: pan.view)//返回计算为接收器表示的手势的给定视图中的位置的点。
        debugPrint("pan.location(in: pan.view) = \(location)")
        
        let orgin: CGPoint = pan.translation(in: pan.view)//平移手势在指定视图的坐标系中的平移。
        debugPrint("pan.translation(in: pan.view) = \(orgin)")
        
        
        
        //debugPrint("label.frame.origin = \(label.frame.origin)")//label.frame.origin原点
        
        if pan.state == .began
        {//每次拖动只会执行一次
            label.text = "拖拽手势-state == .began"
            label.textColor = UIColor.red
            label.backgroundColor = UIColor.white
            self.view.bringSubviewToFront(label)
            
            debugPrint("if pan.state == .began")
        }
        else if pan.state == .changed {
            //只代表状态更改：每次移动时都会执行
            debugPrint("if pan.state == .changed")
            
            //移动: 原点+手势的方向点
            label.transform = CGAffineTransform(translationX: orgin.x, y: orgin.y)
        }
        else if pan.state == .ended
        {
            label.text = "拖拽手势-state == .ended"
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.black
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                label.text = "拖拽手势-"
                label.backgroundColor = UIColor.orange
                //恢复初始值
                label.transform = .identity
            }
        }
    }
}


// MARK: - 长按手势
extension UseGestureRecognizerDelegateController {
    
    private func addLongView(top: Double) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "长按手势-"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //忽略用户事件并从事件队列中删除:手势事件才能执行
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(40)
            make.top.equalTo(top)
        }
        
        //长按手势
        let longGesture = UILongPressGestureRecognizer()
        longGesture.numberOfTapsRequired = 1 //点击数。
        longGesture.numberOfTouchesRequired = 1 //手指数
        longGesture.minimumPressDuration = 1.0 //手指的最小周期必须按在视图上才能识别手势
        longGesture.delegate = self
        longGesture.addTarget(self, action: #selector(self.longAction(long:)))
        label.addGestureRecognizer(longGesture)
        
        
    }
    
    /// 长按手势
    ///
    /// - Parameter long: long description
    @objc func longAction(long: UILongPressGestureRecognizer) {
        debugPrint("[#selector]长按手势UILongPressGestureRecognizer:")
        
        if long.state == .changed {
            
            let label = long.view as! UILabel
            label.text = "长按手势-已执行"
            label.textColor = UIColor.white
            label.backgroundColor = UIColor.black
            
            let alert = UIAlertController(title: "长按手势", message: "长按手势-已执行", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "确定", style: .destructive, handler: nil))
            self.present(alert, animated: true) {
                label.text = "长按手势-"
                label.backgroundColor = UIColor.orange
            }
        }
    }
    
}



extension UseGestureRecognizerDelegateController: UIGestureRecognizerDelegate {
}
//
//// MARK: - UIGestureRecognizerDelegate
//extension UseGestureRecognizerDelegateController: UIGestureRecognizerDelegate {
//
//
//
//
//    /// 绑定对象是否接受该触摸对象
//    ///
//    /// - Parameters:
//    ///   - gestureRecognizer: gestureRecognizer description
//    ///   - touch: touch description
//    /// - Returns: return value description
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        //let result = false :拖拽手势、轻点手势 都无效
//        let result = true
//        debugPrint("[gestureRecognizer()]绑定对象是否接受该触摸对象 result = \(result)")
//        return result
//    }
//
//
//    /// 向代表询问手势识别器是否应该接收表示按压的对象。
//    ///
//    /// - Parameters:
//    ///   - gestureRecognizer: gestureRecognizer description
//    ///   - press: press description
//    /// - Returns: return value description
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
//        //let result = false :拖拽手势、轻点手势 都不受影响
//        let result = true
//        debugPrint("[gestureRecognizer()]向代表询问手势识别器是否应该接收表示按压的对象。 result = \(result)")
//        return result
//    }
//
//
//    /// 询问代表是否应允许两个手势识别器同时识别手势。
//    ///
//    /// - Parameters:
//    ///   - gestureRecognizer: 应该同时认识
//    ///   - otherGestureRecognizer: 其他手势识别器
//    /// - Returns: return value description
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        //let result = false :
//        let result = true
//        debugPrint("[gestureRecognizer()]询问代表是否应允许两个手势识别器同时识别手势。 result = \(result)")
//        return result
//    }
//
//    /// 询问代表是否手势识别器需要另一个手势识别器失败。
//    ///
//    /// - Parameters:
//    ///   - gestureRecognizer: gestureRecognizer description
//    ///   - otherGestureRecognizer: otherGestureRecognizer description
//    /// - Returns: return value description
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        //let result = true :
//        let result = false
//        debugPrint("[gestureRecognizer()]询问代表是否手势识别器需要另一个手势识别器失败。 result = \(result)")
//        return result
//    }
//
//
//    /// 询问代表是否应该要求手势识别器通过另一个手势识别器失败。
//    ///
//    /// - Parameters:
//    ///   - gestureRecognizer: gestureRecognizer description
//    ///   - otherGestureRecognizer: otherGestureRecognizer description
//    /// - Returns: return value description
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        //let result = true :
//        let result = false
//        debugPrint("[gestureRecognizer()]询问代表是否应该要求手势识别器通过另一个手势识别器失败。 result = \(result)")
//        return result
//    }
//
//    /// 手势是否发生
//    ///
//    /// - Parameter gestureRecognizer: gestureRecognizer description
//    /// - Returns: return value description
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        switch gestureRecognizer.state {
//        case .possible:
//            debugPrint("[gestureRecognizerShouldBegin()]手势识别器尚未识别其手势，但可能正在评估触摸事件。 这是默认状态。")
//            break
//        case .began :
//            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到被识别为连续手势的触摸对象。 它在运行循环的下一个循环发送其动作消息（或消息）。")
//            break
//        case .cancelled:
//            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到导致取消连续手势的触摸。 它在运行循环的下一个周期发送其动作消息（或消息）并将其状态重置为")
//            break
//        case .changed:
//            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到被识别为对连续手势的改变的触摸。 它在运行循环的下一个循环发送其动作消息（或消息）。")
//            break
//        case .ended:
//            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到被识别为连续手势的结束的触摸。 它在运行循环的下一个周期发送其动作消息（或消息）并将其状态重置为")
//            break
//        case .failed:
//            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到其无法识别为其手势的多点触摸序列。 未发送任何操作消息，并且手势识别器将重置为UIGestureRecognizer.State.possible。")
//            break
//        default:
//            break
//        }
//
//
//        return true
//    }
//}
