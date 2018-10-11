//
//  HYCustomTabBar.swift
//  SwiftProject
//
//  Created by Duntech on 2018/10/10.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYCustomTabBar: UITabBar {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.tintColor = kAppThemeColor
        self.isTranslucent = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 重新布局subviews
    override func layoutSubviews() {
        
        super.layoutSubviews()
        for view in self.subviews {
            
            print("subview count")
            if NSStringFromClass(view.classForCoder) == "UITabBarButton" {
                
                print(view)
            }
        }
    }
    
}
