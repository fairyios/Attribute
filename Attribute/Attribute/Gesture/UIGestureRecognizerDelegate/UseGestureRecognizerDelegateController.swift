


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
        self.view.backgroundColor = UIColor.orange
        
        //添加拖拽手势
        let panGesture = UIPanGestureRecognizer.init()
        panGesture.minimumNumberOfTouches = 1  //手指个数 /*最大最小的手势触摸次数*/
        panGesture.maximumNumberOfTouches = 2 //手指个数 /*最大最小的手势触摸次数*/
        panGesture.delegate = self// 指定delegate后，实现的delegate才能执 行
        panGesture.addTarget(self, action: #selector(self.panAction(pan:)))
        self.view.addGestureRecognizer(panGesture)
        
        //添加轻点手势
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.delegate = self
        tapGesture.addTarget(self, action: #selector(self.tapAction(tap:)))
        self.view.addGestureRecognizer(tapGesture)
        
        //长按手势
        let longGesture = UILongPressGestureRecognizer()
        longGesture.addTarget(self, action: #selector(self.longAction(long:)))
        self.view.addGestureRecognizer(longGesture)
        
        //清扫手势:用于查找一个或多个方向的滑动手势。 ??????????????????????
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.addTarget(self, action: #selector(self.swipeAction(swipe:)))
        self.view.addGestureRecognizer(swipeGesture)
        
        //捏手势识别器
        let pinchGesture = UIPinchGestureRecognizer()
        pinchGesture.addTarget(self, action: #selector(self.pinchAction(pinch:)))
        self.view.addGestureRecognizer(pinchGesture)
        
        //旋转手势识别器
        let rotationGesture = UIRotationGestureRecognizer()
        rotationGesture.addTarget(self, action: #selector(self.rotationAction(rotation:)))
        self.view.addGestureRecognizer(rotationGesture)
        
        //屏幕边缘拖动手势识别器
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer()
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
    
    
    /// 捏手势识别器
    ///
    /// - Parameter pinch: pinch description
    @objc func pinchAction(pinch: UIPinchGestureRecognizer) {
        //let scale = pinch.scale
        ///let velocity = pinch.velocity
        debugPrint("[#selector]捏手势识别器UIPinchGestureRecognizer: pinch.scale = \(pinch.scale), pinch.velocity = \(pinch.velocity)")
    }
    
    
    /// 清扫手势
    ///
    /// - Parameter swipe: swipe description
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        swipe.direction = [UISwipeGestureRecognizer.Direction.right , .left]
        debugPrint("[#selector]清扫手势UISwipeGestureRecognizer: swipe.direction = \(swipe.direction)")
    }
    
    
    /// 长按手势
    ///
    /// - Parameter long: long description
    @objc func longAction(long: UILongPressGestureRecognizer) {
        debugPrint("[#selector]长按手势UILongPressGestureRecognizer:")
    }
    
    /// 拖拽手势
    ///
    /// - Parameter pan: pan description
    @objc func panAction(pan: UIPanGestureRecognizer) {
        
        let orgin: CGPoint = pan.translation(in: self.view)
        debugPrint("[#selector]拖拽手势UIPanGestureRecognizer: let orgin: CGPoint = \(orgin)")
    }
    
    
    
    /// 轻点手势
    ///
    /// - Parameter tap: tap description
    @objc func tapAction(tap: UITapGestureRecognizer) {
        debugPrint("[#selector]轻点手势UITapGestureRecognizer:")
    }
}



// MARK: - UIGestureRecognizerDelegate
extension UseGestureRecognizerDelegateController: UIGestureRecognizerDelegate {
    
    
    
    
    /// 绑定对象是否接受该触摸对象
    ///
    /// - Parameters:
    ///   - gestureRecognizer: gestureRecognizer description
    ///   - touch: touch description
    /// - Returns: return value description
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //let result = false :拖拽手势、轻点手势 都无效
        let result = true
        debugPrint("[gestureRecognizer()]绑定对象是否接受该触摸对象 result = \(result)")
        return result
    }
    
    
    /// 向代表询问手势识别器是否应该接收表示按压的对象。
    ///
    /// - Parameters:
    ///   - gestureRecognizer: gestureRecognizer description
    ///   - press: press description
    /// - Returns: return value description
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        //let result = false :拖拽手势、轻点手势 都不受影响
        let result = true
        debugPrint("[gestureRecognizer()]向代表询问手势识别器是否应该接收表示按压的对象。 result = \(result)")
        return result
    }
    
    
    /// 询问代表是否应允许两个手势识别器同时识别手势。
    ///
    /// - Parameters:
    ///   - gestureRecognizer: 应该同时认识
    ///   - otherGestureRecognizer: 其他手势识别器
    /// - Returns: return value description
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //let result = false :
        let result = true
        debugPrint("[gestureRecognizer()]询问代表是否应允许两个手势识别器同时识别手势。 result = \(result)")
        return result
    }
    
    /// 询问代表是否手势识别器需要另一个手势识别器失败。
    ///
    /// - Parameters:
    ///   - gestureRecognizer: gestureRecognizer description
    ///   - otherGestureRecognizer: otherGestureRecognizer description
    /// - Returns: return value description
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //let result = true :
        let result = false
        debugPrint("[gestureRecognizer()]询问代表是否手势识别器需要另一个手势识别器失败。 result = \(result)")
        return result
    }
    
    
    /// 询问代表是否应该要求手势识别器通过另一个手势识别器失败。
    ///
    /// - Parameters:
    ///   - gestureRecognizer: gestureRecognizer description
    ///   - otherGestureRecognizer: otherGestureRecognizer description
    /// - Returns: return value description
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        //let result = true :
        let result = false
        debugPrint("[gestureRecognizer()]询问代表是否应该要求手势识别器通过另一个手势识别器失败。 result = \(result)")
        return result
    }
    
    /// 手势是否发生
    ///
    /// - Parameter gestureRecognizer: gestureRecognizer description
    /// - Returns: return value description
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        switch gestureRecognizer.state {
        case .possible:
            debugPrint("[gestureRecognizerShouldBegin()]手势识别器尚未识别其手势，但可能正在评估触摸事件。 这是默认状态。")
            break
        case .began :
            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到被识别为连续手势的触摸对象。 它在运行循环的下一个循环发送其动作消息（或消息）。")
            break
        case .cancelled:
            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到导致取消连续手势的触摸。 它在运行循环的下一个周期发送其动作消息（或消息）并将其状态重置为")
            break
        case .changed:
            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到被识别为对连续手势的改变的触摸。 它在运行循环的下一个循环发送其动作消息（或消息）。")
            break
        case .ended:
            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到被识别为连续手势的结束的触摸。 它在运行循环的下一个周期发送其动作消息（或消息）并将其状态重置为")
            break
        case .failed:
            debugPrint("[gestureRecognizerShouldBegin()]手势识别器已经接收到其无法识别为其手势的多点触摸序列。 未发送任何操作消息，并且手势识别器将重置为UIGestureRecognizer.State.possible。")
            break
        default:
            break
        }
        
        
        return true
    }
}
