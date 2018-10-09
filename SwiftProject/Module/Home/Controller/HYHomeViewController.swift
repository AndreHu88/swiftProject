//
//  HYHomeViewController.swift
//  Token_Swift
//
//  Created by Duntech on 2018/8/23.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import SGPagingView

class HYHomeViewController: HYBaseViewController {
    
    var pageTitleView: SGPageTitleView?
    var pageContentView : SGPageContentView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        requestHomeTitle()
    }
    
    func requestHomeTitle() {
        
        HYHomeNetworkTool.getHomeNewsTitleData { (homeNewsTitleArray) in
            
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = .black
            configuration.indicatorColor = .clear
            self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 48), delegate: self, titleNames: homeNewsTitleArray.compactMap({ $0.name }), configure: configuration)
            self.view.addSubview(self.pageTitleView!)
            
            for titleModel : HYHomeTitleModel in homeNewsTitleArray {
                
                switch titleModel.category {
                    
                case .recommend :
                    let recommendVC = HYHomeRecommendVC()
                    recommendVC.newsTitleModel = titleModel
                    recommendVC.setupRefresh(category: .recommend)
                    self.addChildViewController(recommendVC);
                default :
                    let recommendVC = HYHomeRecommendVC()
                    recommendVC.newsTitleModel = titleModel
                    recommendVC.setupRefresh(category: .recommend)
                    self.addChildViewController(recommendVC);
                }
                
            }
            
            self.pageContentView = SGPageContentView(frame: CGRect(x: 0, y: 48, width: kScreenWidth, height: self.view.height - 48), parentVC: self, childVCs: self.childViewControllers)
            self.pageContentView?.delegatePageContentView = self;
            self.view.addSubview(self.pageContentView!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension HYHomeViewController : SGPageTitleViewDelegate, SGPageContentViewDelegate{
    
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentView?.setPageContentViewCurrentIndex(selectedIndex)
    }
    
    func pageContentView(_ pageContentView: SGPageContentView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView?.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
