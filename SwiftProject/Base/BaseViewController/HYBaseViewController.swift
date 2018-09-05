//
//  HYBaseViewController.swift
//  Token_Swift
//
//  Created by Duntech on 2018/7/11.
//  Copyright © 2018 Duntech. All rights reserved.
//

import UIKit

class HYBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_background"), for: .default)
        navigationController?.navigationBar.tintColor = kAppWhiteColor
        navigationController?.navigationBar.barStyle = .black
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

