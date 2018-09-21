//
//  HYCommonProtocol.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/19.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import Foundation

protocol BaseCommonProtocl {
    
    var title : String { get }
    var titleColor : UIColor { get }
}

extension BaseCommonProtocl{
    
    var title: String {
        return "title"
    }
    
    var titleColor: UIColor {
        return  UIColor.red
    }
}
