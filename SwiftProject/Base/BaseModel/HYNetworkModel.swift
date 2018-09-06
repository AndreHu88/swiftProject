//
//  HYNetworkModel.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/6.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import HandyJSON

class HYNetworkModel: HandyJSON{
    
    var message : String?
    var data : Any?
    var error : NetworkRequestError = .none
    required init() {}
}

//错误类型
enum NetworkRequestError : Int {
    
    case none = 0
    case networkError = 1
    case serverError = 2
    case responseError = 3
}
