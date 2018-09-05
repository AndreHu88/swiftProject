//
//  HttpRequest.swift
//  Token_Swift
//
//  Created by Duntech on 2018/7/11.
//  Copyright © 2018 Duntech. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let sharedInstance = HttpRequest()

//网络请求回调
typealias networkComplectionColsure = (_ success : Bool, _ result : [String : AnyObject]?, _ error : Error?) -> ()

enum RequestType {
    case Get
    case Post
}

class HttpRequest: NSObject {
    
    class func post(url : String, parameters : [String : Any]?, complection : @escaping networkComplectionColsure) {
        
        HttpRequest.request(requestType:.Post, url: url, parameters: parameters, complection: complection)
    }
    
   class func get(url : String, parameters : [String : Any]?, complection : @escaping networkComplectionColsure) {
    
       HttpRequest.request(requestType:.Get, url: url, parameters: parameters, complection: complection)
    }
    
    
   class func request(requestType : RequestType, url : String, parameters : [String : Any]?, complection : @escaping networkComplectionColsure) {
    
        let requestUrl = api_baseUrl + url
        let method = (requestType == .Get) ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(requestUrl, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { ( response) in
        
            switch response.result{
                
                case .success(let value):
                    if let dict = value as? [String : AnyObject] {
                        complection(true, dict, nil)
                    }
                
                case .failure(let error):
                    complection(false, nil, error)
                
            }
            
        }
    }
    
}

