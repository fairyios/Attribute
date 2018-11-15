 
 //
 //  ViewController.swift
 //  Attribute
 //
 //  Created by Fairy on 2018/11/6.
 //  Copyright © 2018 fairyios. All rights reserved.
 //
 
 import UIKit
 import SnapKit
 
 
 /// 
 internal final class ThreadHomeCourseCellDataSource: IFtableViewDataSouce {
    
    var source: [Dictionary<String, ((UIViewController, IndexPath, String) -> Void)?>] = [
        [
            "DispatchQueue.main.asyncAfter": {(target, indexPath, rowKey) -> Void in
                let asyncAfter = DispatchQueueMainAsyncAfterController()
                target.show(asyncAfter, sender: nil)
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
        [
            "": {(target, indexPath, rowKey) -> Void in
                
            }
        ],
    ]
    
 }
 
 /// ThreadHomeController
 internal final class ThreadHomeController: UIViewController, IController {
    
    var navigationTitle: String? = nil
    
    convenience init(title: String) {
        self.init()
        self.navigationTitle = title
    }
    private lazy var myTable: FtableView! = {
        let data = ThreadHomeCourseCellDataSource()
        let table = FtableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.navigationTitle
        self.view.backgroundColor = UIColor.orange
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
    }
    
    /// 三个任务，分别开辟三个线程，都执行完毕后通知主线程（group）
    private func initGroupThread() {
        //https://blog.csdn.net/cewei711/article/details/80476602
        
        //let group = DispatchGroup()
        let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent, target: DispatchQueue.main)
//        queue1.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 1), execute: DispatchWorkItem.init(block: {
//            self.navigationItem.title = "queue1.asyncAfter"
//            print("queue1.asyncAfter")
//        }))
//        queue1.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 2), execute: DispatchWorkItem.init(block: {
//             print("queue1.asyncAfter")
//
//            self.navigationController?.navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
//            ]
//        }))
        
        queue1.async {
            sleep(1)//秒
            self.navigationItem.title = "queue1.asyncsleep(1)//秒"
            print("queue1.asyncsleep(1)//秒")

        }
        queue1.async {
            sleep(3)//秒
            //self.navigationItem.title = "queue1.asyncsleep(3)//秒"
            print("queue1.asyncsleep(3)//秒")
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
            ]
        }
        
        let queue2 = DispatchQueue(label: "queue2", attributes: .concurrent, target: DispatchQueue.main)
        queue2.async {
            sleep(2)//秒
//            self.navigationController?.navigationBar.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.white.cgColor
//            ]
            //self.navigationItem.title = "queue2.async"
            print("queue2.async")
        }
//
//        group.notify(queue: DispatchQueue.main) {
//            //self.navigationItem.title = "group.notify(queue: DispatchQueue.main) 完成"
//        }
    }
    
 }
 
 
