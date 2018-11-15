//
//  ViewController.swift
//  Attribute
//
//  Created by Fairy on 2018/11/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

internal final class HomeCourseCellDataSource: ICourseCellDataSource {
    
    internal static let sectionUI = "UI"
    internal static let sectionKit = "第三方"
    internal static let sectionSwift = "Swift"
    internal static let sectionThread = "线程"
    internal static let sectionIosDiffrent = "IOS系统版本差异"
    internal static let sectionPit = "踩坑"
    internal static let sectionBluetooth = "蓝牙"
    internal static let sectionPrint = "打印"
    internal static let sectionNetwork = "网络"
    internal static let sectionSystemSource = "系统资源"//文件操作,相机,
    internal static let sectionDB = "数据库+缓存"
    internal static let sectionCpu = "性能+CPU..."
    
    //--UI--
    internal static let rowUIUnit: String = "小部件"
    internal static let rowUIPart: String = "大部件"
    //--Kit--
    internal static let rowKitSnapKit: String = "SnapKit"
    //--Swift--
    internal static let rowSwift1: String = "Swift1"
    //--Thread--
    internal static let rowThread1: String = "Thread1"
    //--_iosDiffrent--
    internal static let rowIosDiffrentD1 = "IOS系统版本差异 1"
    //--_pit--
    internal static let rowPitPit1 = "踩坑 1"
    
    //--sectionBluetooth--
    internal static let rowBluetooth1 = "蓝牙"
    //--sectionPrint--
    internal static let rowPrint1 = "打印"
    //--sectionNetwork--
    internal static let rowNetworkHttp = "http"
    internal static let rowNetworkMqtt = "mqtt"
    //--sectionSystemSource--
    internal static let rowSystemSource1 = "文件操作"
    internal static let rowSystemSource2 = "相机"
    internal static let rowSystemSource3 = "视频"
    //--sectionDB--
    internal static let rowDB1 = "数据库+缓存"
    //--sectionCpu--
    internal static let rowCpu1 = "性能+CPU..."
    
    var sections: [String] = [
        sectionUI,
        sectionKit, sectionSwift,
        sectionThread,
        sectionIosDiffrent, sectionPit,
        sectionBluetooth, sectionPrint,
        sectionNetwork, sectionSystemSource, sectionDB,
        sectionCpu
    ]
    
    var rows: [[String]] = [
        [rowUIUnit, rowUIPart],
        [rowKitSnapKit],
        [rowSwift1],
        [rowThread1],
        [rowIosDiffrentD1],
        [rowPitPit1],
        [rowBluetooth1],
        [rowPrint1],
        [rowNetworkHttp, rowNetworkMqtt],
        [rowSystemSource1, rowSystemSource2, rowSystemSource3],
        [rowDB1],
        [rowCpu1]
    ]
    
    var actions: Dictionary<String, ((UIViewController,IndexPath) -> Void)?> = [
        rowUIUnit: {(target, indexPath) -> Void in
            let unitController = UnitHomeController()
            target.show(unitController, sender: nil)
        },
        rowUIPart: {(target, indexPath) -> Void in
            let part = PartHomeController()
            target.show(part, sender: nil)
        },
        rowKitSnapKit: {(target, indexPath) -> Void in
            
        },
        rowSwift1: {(target, indexPath) -> Void in
            let homeTable = SwiftHomeController()
            target.show(homeTable, sender: nil)
        },
        rowThread1: {(target, indexPath) -> Void in
            let homeTable = ThreadHomeController()
            target.show(homeTable, sender: nil)
        },
        rowIosDiffrentD1: {(target, indexPath) -> Void in
            
        },
        rowPitPit1: {(target, indexPath) -> Void in
        
        },
        rowBluetooth1: {(target, indexPath) -> Void in
        
        },
        rowPrint1: {(target, indexPath) -> Void in
        
        },
        rowNetworkHttp: {(target, indexPath) -> Void in
        
        },
        rowNetworkMqtt: {(target, indexPath) -> Void in
            
        }
    ]
    
    
}

/// HomeController
internal final class HomeController: UIViewController {
    
    private lazy var myTable: CourseTableView! = {
        let data = HomeCourseCellDataSource()
        let table = CourseTableView(target: self, data: data)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Attribute"
        
        self.view.addSubview(self.myTable)
        self.myTable.snp.remakeConstraints { maker in maker.edges.equalTo(self.view) }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
