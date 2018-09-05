//
//  HYHomeTableViewController.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/5.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYHomeTableViewController: HYBaseTableViewController {

    var newsTitleModel : HYHomeTitleModel = HYHomeTitleModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        setupRefresh()
    }
    
    func setupRefresh(category : NewsTitleCategory = .recommend) {
        
        let refreshHeader = TTRefreshHeader {
            
        }
        
        refreshHeader?.lastUpdatedTimeLabel.isHidden = true
        self.tableView.mj_header = refreshHeader;
        
        let refreshFooter = TTRefreshFooter {
            
        }
        refreshFooter?.isAutomaticallyChangeAlpha = true;
        self.tableView.mj_footer = refreshFooter;
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
