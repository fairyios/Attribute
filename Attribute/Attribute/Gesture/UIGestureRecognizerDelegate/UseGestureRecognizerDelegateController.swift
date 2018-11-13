


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
internal final class UseGestureRecognizerDelegateController: UIViewController,
    UIScrollViewDelegate {
    
    private let scrollView: UIScrollView = {
        let scrollV = UIScrollView(frame: CGRect.zero)
        scrollV.backgroundColor = UIColor.gray
        scrollV.showsHorizontalScrollIndicator = true
        scrollV.showsVerticalScrollIndicator = true
        scrollV.isScrollEnabled = true // 可以上下滚动
        return scrollV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = GestureHomeCourseCellDataSource.rowGestureDelegate
        //
        self.view.backgroundColor = UIColor.white
        //
        self.view.addSubview(self.scrollView)
        self.scrollView.delegate = self
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }

        let tapLabel = self.addTapView(top: nil)
        let tapLabel1 = self.addTapView(top: tapLabel)
        let tapLabel2 = self.addTapView(top: tapLabel1)
        let tapLabel3 = self.addTapView(top: tapLabel2)
        let tapLabel4 = self.addTapView(top: tapLabel3)
        let tapLabel5 = self.addTapView(top: tapLabel4)
        let tapLabel6 = self.addTapView(top: tapLabel5)
        let _ = self.addTapView(top: tapLabel6)
        
//        self.addPanView(top: Double(120.0))
//        self.addLongView(top: Double(170.0))
//        self.addSwipeView(top: Double(220.0))
//        self.addPinchView(top: Double(420.0))
//        self.addRotationView(top: Double(620))
//        self.addScreenEdgePanView(top: Double(720))
    }
    
}


// MARK: - 屏幕边缘拖动手势
extension UseGestureRecognizerDelegateController {

    private func addScreenEdgePanView(top: Double) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "屏幕边缘拖动手势-"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        label.isMultipleTouchEnabled = true// 设置label支持多点触碰
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(Double(50))
            make.top.equalTo(top)
        }
        
        //屏幕边缘拖动手势识别器
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer()
        screenEdgePanGesture.delegate = self
        screenEdgePanGesture.addTarget(self, action: #selector(self.screenEdgePanAction(screenEdgePan:)))
        label.addGestureRecognizer(screenEdgePanGesture)
        
        
    }
    /// 屏幕边缘拖动手势识别器
    ///
    /// - Parameter screenEdgePan: screenEdgePan description
    @objc func screenEdgePanAction(screenEdgePan: UIScreenEdgePanGestureRecognizer) {
        debugPrint("[#selector]屏幕边缘拖动手势识别器UIScreenEdgePanGestureRecognizer: ")
    }
}

// MARK: - 旋转手势
extension UseGestureRecognizerDelegateController {
    
    private func addRotationView(top: Double) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "旋转手势-"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        label.isMultipleTouchEnabled = true// 设置label支持多点触碰
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(Double(50))
            make.top.equalTo(top)
        }
        
        //旋转手势识别器
        let rotationGesture = UIRotationGestureRecognizer()
        rotationGesture.delegate = self
        rotationGesture.addTarget(self, action: #selector(self.rotationAction(rotation:)))
        label.addGestureRecognizer(rotationGesture)
        
        
    }
    
    /// 旋转手势识别器
    ///
    /// - Parameter rotation: rotation description
    @objc func rotationAction(rotation: UIRotationGestureRecognizer) {
        
        debugPrint("[#selector]旋转手势识别器UIRotationGestureRecognizer: ")
    }
    
}



// MARK: - 捏合手势识别器
extension UseGestureRecognizerDelegateController {
    private func addPinchView(top: Double) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "捏合手势-"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        label.isMultipleTouchEnabled = true// 设置label支持多点触碰
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(Double(100))
            make.top.equalTo(top)
        }
        
        
        //捏合手势识别器
        let pinchGesture = UIPinchGestureRecognizer()
        pinchGesture.delegate = self
        pinchGesture.addTarget(self, action: #selector(self.pinchAction(pinch:)))
        label.addGestureRecognizer(pinchGesture)
        
        
        
    }
    
    /// 捏合手势识别器
    ///
    /// - Parameter pinch: pinch description
    @objc func pinchAction(pinch: UIPinchGestureRecognizer) {
        //let scale = pinch.scale
        ///let velocity = pinch.velocity
        debugPrint("[#selector]捏合手势识别器UIPinchGestureRecognizer: pinch.scale = \(pinch.scale), pinch.velocity = \(pinch.velocity)")
    }
}


// MARK: - 轻扫手势
extension UseGestureRecognizerDelegateController {
    
    private func addSwipeView(top: Double) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "轻扫手势-"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        label.isMultipleTouchEnabled = true// 设置label支持多点触碰
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(Double(100))
            make.top.equalTo(top)
        }
        
        //轻扫手势:用于查找一个或多个方向的滑动手势。
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.numberOfTouchesRequired = 1 //手指数
        //UISwipeGestureRecognizer.Direction.right
        //swipeGesture.direction = [.right , .left, .up, .down]
        swipeGesture.direction = [.left] //方向只能同时设置一个，替换方案：加多个轻扫手势
        swipeGesture.delegate = self
        swipeGesture.addTarget(self, action: #selector(self.swipeAction(swipe:)))
        label.addGestureRecognizer(swipeGesture)
        
    }
    
    static var offsetX: CGFloat = CGFloat(0)
    
    /// 轻扫手势
    /// 一次轻扫只能执行一遍代码
    /// - Parameter swipe: swipe description
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        let locationSelfView = swipe.location(in: self.view)//手势在label中位置
        debugPrint("手势在self.view中位置 = \(locationSelfView)")
        
        let locationLabel = swipe.location(in: swipe.view)
        debugPrint("手势在label中位置 = \(locationLabel)")
        
        let label = swipe.view as! UILabel
        label.text = "轻扫手势-执行中"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        
        UseGestureRecognizerDelegateController.offsetX += CGFloat(10)
        let _ = UseGestureRecognizerDelegateController.offsetX
        
        switch swipe.direction {
        case UISwipeGestureRecognizer.Direction.right:
            debugPrint("[#selector]轻扫手势swipe.direction = right")
            
            self.view.bringSubviewToFront(label)
            label.transform = CGAffineTransform(translationX:
                            (label.frame.width - locationLabel.x) , y: locationLabel.y)
            break
        case UISwipeGestureRecognizer.Direction.left:
            debugPrint("[#selector]轻扫手势swipe.direction = left")
            
            self.view.bringSubviewToFront(label)
            label.transform = CGAffineTransform(translationX:
                            -(label.frame.width - locationLabel.x) , y: locationLabel.y)
            break
        default:
            break
        }
        
        
        
        //swipe.state 永远为 .ended
        switch swipe.state {
        case .began:
            debugPrint("[#selector]轻扫手势: swipe.state = .began")
            
            break
        case .changed:
            debugPrint("[#selector]轻扫手势: swipe.state = .changed")
            break
        case .ended:
            debugPrint("[#selector]轻扫手势: swipe.state = .ended")
            
            //duration:秒，动画执行总时间
            //dampingRatio：动画开始之后的延迟（以秒为单位）。
            let animator =  UIViewPropertyAnimator(duration: 3.0, dampingRatio: 3.0) {
                UseGestureRecognizerDelegateController.offsetX = CGFloat(0)
                label.transform = .identity
                
                label.backgroundColor = UIColor.orange
                label.text = "轻扫手势-"
                label.textColor = UIColor.white
            }
            animator.startAnimation()
            break
        case .cancelled:
            debugPrint("[#selector]轻扫手势: swipe.state = .cancelled")
            break
        case .failed:
            debugPrint("[#selector]轻扫手势: swipe.state = .failed")
            break
        case .possible:
            debugPrint("[#selector]轻扫手势: swipe.state = .possible")
            break
        default:
            debugPrint("[#selector]轻扫手势: swipe.state = default")
            break
        }
    }
    
}

// MARK: - 轻点手势
extension UseGestureRecognizerDelegateController {
    /// 轻点手势-单指单击手势
    private func addTapView(top: UILabel?) -> UILabel {
        
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = "轻点手势-单指单击手势"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        self.scrollView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.scrollView.snp.width)
            make.height.equalTo(Double(100))
            if top == nil {
                make.top.equalTo(Double(10.0))
            }
            else {
                make.top.equalTo(top!.snp.bottom).offset(10)
            }
            
        }
        
        //添加轻点手势
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.delegate = self
        tapGesture.addTarget(self, action: #selector(self.tapAction(tap:)))
        label.addGestureRecognizer(tapGesture)
        
        return label
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
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
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
        
        let location = pan.location(in: pan.view)//手势在label中位置
        debugPrint("手势在label中位置 = \(location)")
        
        //平移量
        let translation: CGPoint = pan.translation(in: pan.view)//平移手势在指定视图的坐标系中的平移。
        debugPrint("平移量translation = \(translation)")
        
        //角度
        let angle = sin(translation.x / (label.frame.width))
        debugPrint("角度angle = \(angle)")
        
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
            
            //CGAffineTransform 2D变换：http://xiaoboswift.com/course/91/task/813/show
            //CGAffineTransform 2D变换：translate移动: 原点+手势的方向点
            //CGAffineTransform 2D变换：scale缩放:
            //CGAffineTransform 2D变换：rotate旋转：
            var transform = CGAffineTransform(translationX: translation.x, y: translation.y)
            transform = transform.rotated(by: angle) //rotated 旋转
            debugPrint("旋转transform.rotated(by: angle) = \(transform)")
            label.transform = transform
        }
        else if pan.state == .ended
        {
            debugPrint("拖拽手势-state == .ended")
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
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
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
