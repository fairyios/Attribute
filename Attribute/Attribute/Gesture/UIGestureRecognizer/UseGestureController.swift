


//
//  UIViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit


/// 使用UseGestureController
internal final class UseGestureController: UIViewController,
UIScrollViewDelegate {
    
    
    // UIScrollView 能不能滚动根它的contentSize的大小有关，太小则不能滚动
    private lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView(frame: CGRect.zero)
        // 自适应父视图
        scrollV.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        scrollV.backgroundColor = UIColor.gray
        scrollV.showsHorizontalScrollIndicator = false
        scrollV.showsVerticalScrollIndicator = true
        scrollV.indicatorStyle = .black
        scrollV.isScrollEnabled = true // 可以上下滚动
        
        //如果是把要拉伸的图片加到UIScrollview上边，那么对该scrollview做：
        //scrollV.canCancelContentTouches = false//用于控制内容视图中的触摸是否始终导致跟踪。
        //scrollV.delaysContentTouches = false//用于确定滚动视图是否延迟了触摸式手势的处理(防止只响应UIScrollview的事件)
        
        return scrollV
    }()
    
    private func newUILabel(top: UIView?, text: String) -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.orange
        label.text = text
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true //调整字体大小以适合宽度
        label.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        label.isMultipleTouchEnabled = true// 设置label支持多点触碰
        self.scrollView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self.scrollView.snp.width)
            make.height.equalTo(Double(50))
            if top == nil {
                make.top.equalTo(Double(10.0))
            }
            else {
                make.top.equalTo(top!.snp.bottom).offset(10)
            }
        }
        
        return label
    }
    
    private var imgView: UIImageView!
    //    private var imgViewScale: CGFloat = 1.0
    //    private var imgViewLocation: CGPoint = CGPoint.zero
    
    // MARK: - 页面加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = GestureHomeCourseCellDataSource.rowGestureDelegate
        //
        self.view.backgroundColor = UIColor.white
        //
        self.view.addSubview(self.scrollView)
        self.scrollView.delegate = self
        self.scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(75)
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.leading.equalTo(self.view.snp.leading).offset(20)
            make.trailing.equalTo(self.view.snp.trailing).offset(-20)
        }
        let viewWidth =  self.view.frame.size.width
        //UIScrollView 设置内容大小
        //UIScrollView 能不能滚动根它的contentSize的大小有关，太小则不能滚动
        self.scrollView.contentSize = CGSize(width: viewWidth - 40, height: CGFloat(1200))
        //
        let tapLabel = self.addTapView(top: nil)
        let panLabel = self.addPanView(top: tapLabel)
        let longLabel = self.addLongView(top: panLabel)
        let swipeLabel = self.addSwipeView(top: longLabel)
        let pinchLabel = self.addPinchView(top: swipeLabel)
        let rotationLabel = self.addRotationView(top: pinchLabel)
        let _ = self.addScreenEdgePanView(top: rotationLabel)
    }
    
}


// MARK: - 屏幕边缘拖动手势
extension UseGestureController {
    
    private func addScreenEdgePanView(top: UILabel?) -> UILabel {
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
            if top == nil {
                make.top.equalTo(Double(10.0))
            }
            else {
                make.top.equalTo(top!.snp.bottom).offset(10)
            }
        }
        //屏幕边缘拖动手势识别器
        let screenEdgePanGesture = UIScreenEdgePanGestureRecognizer()
        screenEdgePanGesture.edges = UIRectEdge.right //从右边缘开始滑动
        screenEdgePanGesture.delegate = self
        screenEdgePanGesture.addTarget(self, action: #selector(self.screenEdgePanAction(gesture:)))
        label.addGestureRecognizer(screenEdgePanGesture)
        
        return label
    }
    /// 屏幕边缘拖动手势识别器
    ///
    /// - Parameter screenEdgePan: screenEdgePan description
    @objc func screenEdgePanAction(gesture: UIScreenEdgePanGestureRecognizer) {
        debugPrint("[屏幕边缘拖动手势]: ")
        
        //let location = gesture.location(in: gesture.view)
        //平移量
        let translation = gesture.translation(in: gesture.view)
        
        let label = gesture.view as! UILabel
        
        if gesture.state == .changed {
            label.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        }
        
        if gesture.state == .ended {
            UIViewPropertyAnimator(duration: 3.0, dampingRatio: 3.0) {
                label.transform = .identity
            }.startAnimation()
        }
    }
}

// MARK: - 旋转手势
extension UseGestureController {
    
    private func addRotationView(top: UIView?) -> UILabel {
        let label = self.newUILabel(top: top, text: "旋转手势-")
        label.snp.remakeConstraints { (make) in
            make.width.equalTo(self.scrollView.snp.width)
            make.height.equalTo(Double(300))
            if top == nil {
                make.top.equalTo(Double(10.0))
            }
            else {
                make.top.equalTo(top!.snp.bottom).offset(10)
            }
        }
        //旋转手势识别器
        let rotationGesture = UIRotationGestureRecognizer()
        rotationGesture.delegate = self
        rotationGesture.addTarget(self, action: #selector(self.rotationAction(gesture:)))
        label.addGestureRecognizer(rotationGesture)
        
        return label
    }
    
    /// 旋转手势识别器
    ///
    /// - Parameter rotation: rotation description
    @objc func rotationAction(gesture: UIRotationGestureRecognizer) {
        
        debugPrint("[#selector]旋转手势识别器UIRotationGestureRecognizer: ")
        
        let view = gesture.view as! UILabel
        view.transform = view.transform.rotated(by: gesture.rotation)
        
        if gesture.state == .ended {
            UIViewPropertyAnimator(duration: 3.0, dampingRatio: 3.0) {
                view.transform = .identity
                }.startAnimation()
        }
    }
    
}



// MARK: - 捏合手势识别器
extension UseGestureController {
    
    
    private func addPinchView(top: UIView?) -> UIImageView {
        
        let imgView = UIImageView(frame: CGRect.zero)
        imgView.image = UIImage(named: "huaqiangu_logo_600x600iPhoneXPortraitiOS11_375x812pt")
        imgView.backgroundColor = UIColor.orange
        imgView.isUserInteractionEnabled = true //设置label支持用户交互:忽略用户事件并从事件队列中删除:手势事件才能执行
        imgView.isMultipleTouchEnabled = true// 设置label支持多点触碰
        self.scrollView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(Double(400))
            make.centerX.equalTo(self.scrollView.snp.centerX)
            if top == nil {
                make.top.equalTo(Double(10.0))
            }
            else {
                make.top.equalTo(top!.snp.bottom).offset(10)
            }
        }
        
        let name = UILabel()
        name.text = "捏合手势"
        name.backgroundColor = UIColor.orange
        imgView.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.width.equalTo(imgView.snp.width)
            make.height.equalTo(30)
            make.centerX.equalTo(imgView.snp.centerX)
            make.top.equalTo(imgView.snp.top)
        }
        
        //捏合手势识别器
        let pinchGesture = UIPinchGestureRecognizer()
        //pinchGesture
        pinchGesture.delegate = self
        pinchGesture.addTarget(self, action: #selector(self.pinchAction(pinch:currentTransform:)))
        imgView.addGestureRecognizer(pinchGesture)
        
        self.imgView = imgView
        return imgView
    }
    
    
    /// 捏合手势识别器
    ///
    /// - Parameter pinch: pinch description
    @objc func pinchAction(pinch: UIPinchGestureRecognizer, currentTransform: CGAffineTransform) {
        //let scale = pinch.scale
        ///let velocity = pinch.velocity
        debugPrint("[捏合手势]缩放比例: pinch.scale = \(pinch.scale), 夹点速度/秒 pinch.velocity(velocity=scale/second) = \(pinch.velocity)")
        
        //pinch.location(in: self.scrollView) 都是同一个值
        let location = pinch.location(in: self.scrollView)
        debugPrint("[捏合手势]location = \(location)")
        
        if pinch.state == .began {
            
            
        }
        
        if pinch.state == .changed {
            //let imgLv = self.imgView.frame.width / self.imgView.frame.height
            let newTransform = CGAffineTransform(scaleX: pinch.scale, y: pinch.scale * 1)
            self.imgView.transform = newTransform
        }
        
        if pinch.state == .ended {
            UIViewPropertyAnimator(duration: 3.0, dampingRatio: 3.0) {
                self.imgView.transform = .identity
                }.startAnimation()
        }
    }
}


// MARK: - 轻扫手势
extension UseGestureController {
    
    private func addSwipeView(top: UILabel?) -> UILabel {
        let label = self.newUILabel(top: top, text: "轻扫手势-")
        
        //轻扫手势:用于查找一个或多个方向的滑动手势。
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.numberOfTouchesRequired = 1 //手指数
        //UISwipeGestureRecognizer.Direction.right
        //swipeGesture.direction = [.right , .left, .up, .down]
        swipeGesture.direction = [.left] //方向只能同时设置一个，替换方案：加多个轻扫手势
        swipeGesture.delegate = self
        swipeGesture.addTarget(self, action: #selector(self.swipeAction(swipe:)))
        label.addGestureRecognizer(swipeGesture)
        
        return label
    }
    
    static var offsetX: CGFloat = CGFloat(0)
    
    /// 轻扫手势
    /// 一次轻扫只能执行一遍代码
    /// - Parameter swipe: swipe description
    @objc func swipeAction(swipe: UISwipeGestureRecognizer) {
        
        let locationSelfView = swipe.location(in: self.scrollView)//手势在label中位置
        debugPrint("手势在self.scrollView中位置 = \(locationSelfView)")
        
        let locationLabel = swipe.location(in: swipe.view)
        debugPrint("手势在label中位置 = \(locationLabel)")
        
        let label = swipe.view as! UILabel
        label.text = "轻扫手势-执行中"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        
        UseGestureController.offsetX += CGFloat(10)
        let _ = UseGestureController.offsetX
        
        switch swipe.direction {
        case UISwipeGestureRecognizer.Direction.right:
            debugPrint("[#selector]轻扫手势swipe.direction = right")
            
            self.scrollView.bringSubviewToFront(label)
            label.transform = CGAffineTransform(translationX:
                (label.frame.width - locationLabel.x) , y: locationLabel.y)
            break
        case UISwipeGestureRecognizer.Direction.left:
            debugPrint("[#selector]轻扫手势swipe.direction = left")
            
            self.scrollView.bringSubviewToFront(label)
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
                UseGestureController.offsetX = CGFloat(0)
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
extension UseGestureController {
    /// 轻点手势-单指单击手势
    private func addTapView(top: UILabel?) -> UILabel {
        
        let label = self.newUILabel(top: top, text: "轻点手势-")
        
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
extension UseGestureController {
    private func addPanView(top: UILabel?) -> UILabel {
        let label = self.newUILabel(top: top, text: "拖拽手势-")
        
        //添加拖拽手势
        let panGesture = UIPanGestureRecognizer.init()
        panGesture.minimumNumberOfTouches = 1  //手指个数 /*最大最小的手势触摸次数*/
        panGesture.maximumNumberOfTouches = 1 //手指个数 /*最大最小的手势触摸次数*/
        panGesture.delegate = self// 指定delegate后，实现的delegate才能执 行
        panGesture.addTarget(self, action: #selector(self.panAction(pan:)))
        label.addGestureRecognizer(panGesture)
        
        return label
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
            self.scrollView.bringSubviewToFront(label)
            
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
extension UseGestureController {
    
    private func addLongView(top: UILabel?) -> UILabel {
        let label = self.newUILabel(top: top, text: "长按手势-")
        
        //长按手势
        let longGesture = UILongPressGestureRecognizer()
        longGesture.numberOfTapsRequired = 1 //点击数。
        longGesture.numberOfTouchesRequired = 1 //手指数
        longGesture.minimumPressDuration = 1.0 //手指的最小周期必须按在视图上才能识别手势
        longGesture.delegate = self
        longGesture.addTarget(self, action: #selector(self.longAction(long:)))
        label.addGestureRecognizer(longGesture)
        
        return label
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



extension UseGestureController: UIGestureRecognizerDelegate {
}
//
//// MARK: - UIGestureRecognizerDelegate
//extension UseGestureController: UIGestureRecognizerDelegate {
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
