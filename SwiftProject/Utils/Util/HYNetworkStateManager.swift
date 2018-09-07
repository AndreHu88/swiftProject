//
//  HYNetworkStateManager.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/6.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYNetworkStateManager: NSObject {

    
     static func networkStatusListener() {
        
//        let reachability = Reachability()!
//
//        // 1、设置网络状态消息监听 2、获得网络Reachability对象
//        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChangedAction(_:)), name: Notification.Name.reachabilityChanged, object: reachability)
//
//        do{
//            // 3、开启网络状态消息监听
//            try reachability.startNotifier()
//        }
//        catch{
//            print("could not start reachability notifier")
//        }
        
        let reachability = Reachability()!
        
        
        reachability.whenReachable = { result in
            if result.connection == .wifi {
                print("Reachable via WiFi")
            }
            else {
                print("Reachable via Cellular")
            }
        }
        
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    
    // 主动检测网络状态
    @objc fileprivate func reachabilityChangedAction(_ note: NSNotification) {
        
        let reachability = note.object as! Reachability // 准备获取网络连接信息
        
        if reachability.connection != .none { // 判断网络连接状态
            print("网络连接：可用")
            if reachability.connection == .wifi { // 判断网络连接类型
                print("连接类型：WiFi")
                
            }
            else {
                print("连接类型：移动网络")
               
            }
        }
        else {
            print("网络连接：不可用")
            DispatchQueue.main.async { 
                
            }
        }
    }
}
