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
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
                JRToast.show(withText: "下拉刷新成功")
                self.tableView.mj_header.endRefreshing()
            }
        }
        
        let refreshFooter = TTRefreshFooter {
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                JRToast.show(withText: "上拉加载成功")
                self.tableView.mj_footer.endRefreshing()
            })
        }
        
        refreshHeader?.lastUpdatedTimeLabel.isHidden = true
        self.tableView.mj_header = refreshHeader;
        
        refreshFooter?.isAutomaticallyChangeAlpha = true;
        self.tableView.mj_footer = refreshFooter;
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
