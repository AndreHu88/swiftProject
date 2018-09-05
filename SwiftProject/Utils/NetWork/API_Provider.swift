//
//  API_Provider.swift
//  Token_Swift
//
//  Created by Duntech on 2018/7/17.
//  Copyright © 2018 Duntech. All rights reserved.
//

import UIKit
import Moya

//初始化豆瓣FM请求的provider
let DouBanProvider = MoyaProvider<DouBan>()

/** 下面定义豆瓣FM请求的endpoints（供provider使用）**/

//请求分类
public enum DouBan {
    case login(String,String)  //登录
    case repairList(String)    //获取歌曲
    case newsTitle             //新闻分类
}

//请求配置
extension DouBan: TargetType {
    //服务器地址
    public var baseURL: URL {
        switch self {
        case .login(_, _):
            return URL(string: api_home_title)!
        case .repairList(_):
            return URL(string: api_home_title)!
        default:
            return URL(string: api_baseUrl)!
        }
       
    }
    
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .login(_, _):
            return "/j/app/radio/channels"
        case .repairList(_):
            return "/j/mine/playlist"
        case .newsTitle:
            return api_home_title
        default:
            return ""
        }
    }
    
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .login(let username, let password):
            var params: [String: Any] = [:]
            params["username"] = username
            params["password"] = password
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    //请求头
    public var headers: [String: String]? {
        return nil
    }
}
