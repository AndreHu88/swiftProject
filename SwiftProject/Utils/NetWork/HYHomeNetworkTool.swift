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
        
        HttpRequest.get(url: api_home_title, parameters: nil) { (requestReuslt, dict, error) in
            
            let json = JSON(dict as Any);
            if let dataDict = json["data"]["data"].arrayObject{
                
                var titlesArray = [HYHomeTitleModel]()
                titlesArray.append(HYHomeTitleModel.deserialize(from: "{\"category\": \"\", \"name\": \"推荐\"}")!)
                
                titlesArray += dataDict.compactMap({ dictElement -> HYHomeTitleModel? in
                    return HYHomeTitleModel.deserialize(from: dictElement as? [String : Any])
                })
                
                complectionHandler(titlesArray)
            }
            
        }
    }
    
    
}
