//
//  HYHomeNetworkTool.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/4.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import SwiftyJSON

class HYHomeNetworkTool: NSObject {

    /// 获取首页title数组
    static func getHomeNewsTitleData(complectionHandler : @escaping (_ newsTitleArray : [HYHomeTitleModel]) -> ()){
        
        HttpRequest.get(url: api_home_title, parameters: nil) { (networkModel) in
            
            if networkModel.error != .none { return }
            
            let json = JSON(networkModel.data!);
            if let dataDict = json["data"].arrayObject{
                
                var titlesArray = [HYHomeTitleModel]()
                titlesArray.append(HYHomeTitleModel.deserialize(from: "{\"category\": \"\", \"name\": \"推荐\"}")!)
                
                titlesArray += dataDict.compactMap({ dictElement -> HYHomeTitleModel? in
                    return HYHomeTitleModel.deserialize(from: dictElement as? [String : Any])
                })
                
                complectionHandler(titlesArray)
            }
        }
    }
    
    static func getHomeNewsDataArray(pageNo : Int, complection : @escaping (_ newsArray : [NewsModel]) -> ()){
        
        let params = ["count" : 20,
                      "list_count" : pageNo]
        HttpRequest.post(url: api_home_news, parameters: params) { (networkModel) in
            
            if networkModel.error != .none { return }
            
        }
    }
    
}
