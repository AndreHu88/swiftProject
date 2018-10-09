//
//  TTRefreshHeader.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/5.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import MJRefresh

class TTRefreshHeader: MJRefreshGifHeader {

    
    override func prepare() {
        
        super.prepare()
        var imageArray = [UIImage]()
        for index in 0..<16 {
            
            let image = UIImage(named: "dropdown_loading_0\(index)")
            imageArray.append(image!)
        }
        
        setImages(imageArray, for: .idle)
        setImages(imageArray, for: .refreshing)
        setTitle("下拉推荐", for: .idle)
        setTitle("松开推荐", for: .pulling)
        setTitle("推荐中", for: .refreshing)
    }
    
    override func placeSubviews() {
        
        super.placeSubviews()
        gifView.contentMode = .center
        gifView.frame = CGRect(x: 0, y: 4, width: mj_w, height: 25)
        stateLabel.font = UIFont.systemFont(ofSize: 12)
        stateLabel.frame = CGRect(x: 0, y: 35, width: mj_w, height: 14)
    }
}

class TTRefreshFooter : MJRefreshAutoGifFooter {
    
    override func prepare() {
        
        super.prepare()
        var imageArray = [UIImage]()
        for index in 0..<8 {
            
            let image = UIImage(named: "sendloading_18x18_\(index)")
            imageArray.append(image!)
        }
        
        setImages(imageArray, for: .idle)
        setImages(imageArray, for: .refreshing)
        
        setTitle("上拉加载数据", for: .idle)
        setTitle("正在努力加载", for: .pulling)
        setTitle("正在努力加载", for: .refreshing)
        setTitle("没有更多数据啦", for: .noMoreData)
    }
    
    override func placeSubviews() {
        
        super.placeSubviews()
        gifView.contentMode = .center
        gifView.left = kAdaptedWidth(135)
        gifView.centerY = stateLabel.centerY
    }
}
