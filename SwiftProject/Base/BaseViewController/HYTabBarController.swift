//
//  HYTabBarController.swift
//  Token_Swift
//
//  Created by 胡勇 on 2018/7/11.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = kAppNavigationBarTintColor
        setChildViewController(HYHomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        setChildViewController(HYVideoViewController(), title: "视频", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(HYMineViewController(), title: "个人中心", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
    }
    
    
    func setChildViewController(_ childVC: UIViewController, title : String, imageName : String, selectImageName : String) {
    
        let navVC = HYBaseNavController(rootViewController: childVC)
        childVC.title = title;
        childVC.tabBarItem.image = UIImage.init(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        addChildViewController(navVC)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
