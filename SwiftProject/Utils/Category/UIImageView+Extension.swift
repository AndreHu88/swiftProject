//
//  UIImageView+Extension.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/5.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// 设置图片圆角
    func circleImage() {
        /// 建立上下文
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        /// 获取当前上下文
        let ctx = UIGraphicsGetCurrentContext()
        /// 添加一个圆，并裁剪
        ctx?.addEllipse(in: self.bounds)
        ctx?.clip()
        /// 绘制图像
        self.draw(self.bounds)
        /// 获取绘制的图像
        let image = UIGraphicsGetImageFromCurrentImageContext()
        /// 关闭上下文
        UIGraphicsEndImageContext()
    
        DispatchQueue.global().async {
            self.image = image
        }
    }
}
