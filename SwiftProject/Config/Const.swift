//
//  Const.swift
//  Token_Swift
//
//  Created by Duntech on 2018/7/13.
//  Copyright © 2018 Duntech. All rights reserved.
//

import UIKit

//全局导入
@_exported import HandyJSON
@_exported import SwiftyJSON
@_exported import SnapKit
@_exported import MBProgressHUD


import YYKit
import MJRefresh
import MBProgressHUD


func DLog <T> (_ message : T, file : String = #file, lineNumber : Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):line:\(lineNumber)]- \(message)")
    #endif
}

// MARK: - 屏幕信息
/// 屏幕的宽度
let kScreenWidth = UIScreen.main.bounds.width

/// 屏幕的高度
let kScreenHeight = UIScreen.main.bounds.height

/* 导航条高度 44 */
let kNavigationHeight :CGFloat  = UINavigationBar.appearance().frame.size.height

/* 状态栏高度 20 */
let kStatuBarHeight   :CGFloat   = UIApplication.shared.statusBarFrame.size.height

/* 导航栏和状态栏高度   */
let kNavigationHeightAndStatuBarHeight   = kNavigationHeight + kStatuBarHeight

/// 是否是iPhone X
let kIsIPhoneX: Bool = (kScreenWidth == 812) ? true : false

/* 屏幕宽度倍率 */
let kWIDTH_MULTIPLE : CGFloat =  kScreenWidth / 375.0;

/*  屏幕分辨率比例 */
let screenScale:CGFloat = UIScreen.main.responds(to: #selector(getter: UIScreen.main.scale)) ? UIScreen.main.scale : 1.0

/** 根据传入的值算出乘以比例之后的值 */
func kAdaptedWidth(_ width : CGFloat) -> CGFloat {
    return CGFloat(width) * kWIDTH_MULTIPLE
}

// MARK: - 常用颜色
let kAppThemeColor = UIColor.colorWithHexString("651413")

let kAppNavigationBarTintColor = UIColor.colorWithHexString("707070")

let kAppWindowColor = UIColor.colorWithHexString("#651413")

let kAppCellBackgroundColor = UIColor.colorWithHexString("#252525")

let kAppTableViewBackgroundColor = UIColor.colorWithHexString("#1b1b1b")

let kAppTableViewSeperatorColor = UIColor.colorWithHexString("707070")

let kAppWhiteColor = UIColor.white

let kAppBlackColor = UIColor.black



/// 颜色获取
func kRGBA(r : CGFloat, g : CGFloat, b : CGFloat, a : CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

// MARK: - Util

/* 弧度转角度 */
func kAngleToRadian(_ angle : CGFloat) -> CGFloat {
    return (CGFloat(Float.pi / 180.0)) * angle
}

// MARK: - 系统信息
/* 设备系统相关  */
let kIOSVersion:String        = UIDevice.current.systemVersion

/* iOS系统版本 */
let KOsType:String             = UIDevice.current.systemName + UIDevice.current.systemVersion

/* app版本  以及设备系统版本 */
let kInfoDictionary            = Bundle.main.infoDictionary

/* App名称 */
let kAppName: String?         = kInfoDictionary!["CFBundleDisplayName"] as? String

/* App版本号 */
let kAppVersion: String?      = kInfoDictionary!["CFBundleShortVersionString"] as? String

/* Appbuild版本号 */
let kAppBuildVersion: String? = kInfoDictionary!["CFBundleVersion"] as? String

/* app bundleId */
let kAppBundleId: String?     = kInfoDictionary!["CFBundleIdentifier"] as? String

/* 平台名称（iphonesimulator 、 iphone） */
let kPlatformName: String?    = kInfoDictionary!["DTPlatformName"] as? String

/* 版本号相同 */
func kSystemVersionEqual(version : String) -> Bool {
    return UIDevice.current.systemVersion == version
}

/* Cache缓存文件夹 */
let cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last

/*  document文件 */
let kDocumentDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first










