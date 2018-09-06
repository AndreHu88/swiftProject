//
//  NewsModel.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/6.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import HandyJSON

class NewsModel: HandyJSON {

    var item_id: Int = 0
    var cell_flag: Int = 0
    var behot_time: Int = 0
    var tip: Int = 0
    var publish_time: TimeInterval = 0
    var publishTime: String = ""
    var create_time: TimeInterval = 0
    var createTime: String { return create_time.description }
    var source_icon_style: Int = 0  // 1,4,6 右侧视频
    var tag_id: Int = 0
    var media_info = MediaInfo()
    var user_info = NewsUserInfo()
    var user = NewsUserInfo()
    var preload_web: Int = 0
    var cell_layout_style: Int = 0
    var group_id: Int = 0
    var cell_type: CellType = .none
    var media_name: String = ""
    
    var user_repin: Int = 0
    var display_url: String = ""
    var url: String = ""
    var repin_count: Int = 0
    var stick_label: String = ""
    var show_portrait_article: Bool = false
    var user_digg = false
    var digg_count: Int = 0
    var has_m3u8_video: Bool = false
    var has_video: Bool = false
    var item_version: Int = 0
    var share_count: Int = 0
    var forward_count: Int = 0
    var source: String = ""
    var article_alt_url: String = ""
    var comment_count: Int = 0
    var cursor: Int = 0
    var video_style: Int = 0
    var show_portrait: Bool = false
    var stick_style: Int = 0
    var ignore_web_transform: Int = 0
    var is_stick: Bool = false
    var verified_content: String = ""
    var share_url: String = ""
    var bury_count: Int = 0
    var article_sub_type: Int = 0
    var allow_download: Bool = false
    var tag: String = ""
    var like_count: Int = 0
    var level: Int = 0
    var read_count: Int = 0
    var article_type: Int = 0
    var user_verified = false
    var rid: String = ""
    
    var title: String = ""
    
    var abstract: String = ""
    
    var is_subject: Bool = false
    var hot: Bool = false  // 热
    var keywords: String = ""
    var source_open_url: String = ""
    var article_url: String = ""
    var ban_comment: Int = 0
    var label: String = ""
    
    var aggr_type: Int = 0
    var has_mp4_video: Int = 0
    var hase_image = false
    var image_list = [ImageList]()
    var large_image_list = [LargeImage]()
    var thumb_image_list = [ThumbImage]()
    
    var middle_image = MiddleImage()
    var video_duration: Int = 0
    var video_id: String = ""
    var gallary_flag = 0
    var gallary_image_count = 0
    var large_image = LargeImage()
    
    var ad_id = 0
    var ad_label = ""
    var sub_title = ""
    var type = "" // app
    var label_style: NewsLabelStyle = .none  // 3 是广告,1是置顶
    var app_name = ""
    var appleid = ""
    var description = ""
    
    var download_url = ""
    var card_type: CardType = .video
    var is_article = false
    var is_preview = false
    var web_url = ""
    

    // 来自
    var brand_info = ""
    
    required init(){}
}

struct MediaInfo: HandyJSON {
    var follow: Bool = false
    var is_star_user: Bool = false
    var recommend_reason: String = ""
    var user_verified: Bool = false
    var media_id: Int = 0
    var verified_content: String = ""
    var user_id: Int = 0
    var recommend_type: Int = 0
    var avatar_url: String = ""
    var name: String = ""
}

struct NewsUserInfo: HandyJSON {
    
    var follow: Bool = false
    var name: String = ""
    var user_verified: Bool = false
    var verified_content: String = ""
    var user_id: Int = 0
    var id: Int = 0
    var description: String = ""
    var desc: String = ""
    var avatar_url: String = ""
    var follower_count: Int = 0
    var followerCount: String { return follower_count.description }
    var user_decoration: String!
    var subcribed: Int = 0
    var fans_count: Int = 0
    var fansCount: String { return fans_count.description }
    var user_auth_info: String!
    var media_id: Int = 0
    var screen_name = ""
    var is_followed: Bool = false
    var is_following: Bool = false // 是否正在关注
    var is_blocking: Bool = false
    var is_blocked: Bool = false
    var is_friend: Bool = false
    var medals = [String]() // hot_post (热门内容)
}

enum CellType : Int , HandyJSONEnum {
    case none = 0
    /// 用户
    case user = 32
    /// 相关关注
    case relatedConcern = 50
}

enum NewsLabelStyle: Int, HandyJSONEnum {
    case none = 0
    case topOrLive = 1      // 置顶或直播
    case ad = 3             // 广告
}

/// 图片的类型
enum ImageType: Int, HandyJSONEnum {
    case normal = 1     // 一般图片
    case gif = 2        // gif 图
}

struct URLList: HandyJSON {
    
    var url: String = ""
}

struct ImageList: HandyJSON {
    
    var type = ImageType.normal
    
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    var width: CGFloat = 0
    
    var uri: String = ""
    /// 宽高比
    var ratio: CGFloat? { return width / height }
}

struct LargeImage: HandyJSON {
    
    var type = ImageType.normal
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    
    var width: CGFloat = 0
    
    var uri: String = ""
}

struct ThumbImage: HandyJSON {
    var type = ImageType.normal
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    
    var width: CGFloat = 0
    
    var uri: String = ""
    
    /// 宽高比
    var ratio: CGFloat { return width / height }
}

struct MiddleImage: HandyJSON {
    var type = ImageType.normal
    var height: CGFloat = 0
    
    var url_list = [URLList]()
    
    var url: NSString = ""
    var urlString: String {
        guard url.hasSuffix(".webp") else { return url as String }
        return url.replacingCharacters(in: NSRange(location: url.length - 5, length: 5), with: ".png")
    }
    var width: CGFloat = 0
    
    var uri: String = ""
    /// 宽高比
    var ratio: CGFloat? { return width / height }
    
}

/// 视频类型
enum CardType: String, HandyJSONEnum {
    case video = "video"             // 视频
    case adVideo = "ad_video"        // 广告视频
    case adTextlink = "ad_textlink"  // 广告链接
}


