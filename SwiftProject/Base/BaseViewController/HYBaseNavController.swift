//
//  HYBaseNavController.swift
//  Token_Swift
//
//  Created by 胡勇 on 2018/7/11.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYBaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 1 {
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
