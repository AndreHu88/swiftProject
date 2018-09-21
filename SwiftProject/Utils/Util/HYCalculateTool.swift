//
//  HYCalculateTool.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/19.
//  Copyright © 2018年 Duntech. All rights reserved.
//

/// 面向协议编程

import Foundation

protocol CalculateProtocol {
    
    // MARK: 计算文本的高度
    static func textHeight(text : String, fontSize : CGFloat, width : CGFloat) -> CGFloat
    
    /// 计算文本的高度
    static func textWidth(text : String, fontSize : CGFloat, height : CGFloat) -> CGFloat
    
    // MARK: 计算富文本的高度
    static func attributedTextHeight(text: NSAttributedString, width: CGFloat) -> CGFloat
}

extension CalculateProtocol {
    
    /// 计算文本的高度
    static func textHeight(text: String, fontSize: CGFloat, width: CGFloat) -> CGFloat {
        
        return text.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size.height + 5
    }
    
    /// 计算文本的宽度
    static func textWidth(text: String, fontSize: CGFloat, height: CGFloat) -> CGFloat {
        
        return text.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size.height
    }
    
    /// 计算富文本的高度
    static func attributedTextHeight(text: NSAttributedString, width: CGFloat) -> CGFloat {
        
        return text.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, context: nil).size.height + 5.0
    }
}

struct CalculateTool : CalculateProtocol{
   
    
    
    
}
