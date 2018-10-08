//
//  HYEmojiTool.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/20.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import Foundation
import HandyJSON

struct Emoji : HandyJSON {
    
    init() {
    }
    
    var id = ""
    var name = ""
    var png = ""
    var isDelete = false
    var isEmpty = false
    
    init(id: String = "", name: String = "", png: String = "", isDelete: Bool = false, isEmpty: Bool = false) {
        self.id = id
        self.name = name
        self.png = png
        self.isDelete = isDelete
        self.isEmpty = isEmpty
    }
}

struct EmojiManager {
    
    var emojis = [Emoji]()
    
    init() {
        
        let path = Bundle.main.path(forResource: "emojis.plist", ofType: nil)
        let emojisArray  = NSArray(contentsOfFile: path!)
        emojis = (emojisArray?.compactMap({ (item) -> Emoji? in
            
            return Emoji.deserialize(from: item as? [String : Any])
        }))!
        
        //遍历数组，对数据进行分页
        var tempArray = [Emoji]()
        for (index , id) in emojis.enumerated() {
            
            //判断每页最后一个添加一个删除按钮
            if index != 0 && index % 20 == 0 {
                let emoji : Emoji = Emoji(png : "input_emoji_delete_44x44", isDelete : true)
                tempArray.append(emoji)
            }
        }
        
    }
    
    func showEmoji(content : String , font : UIFont) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: content)
        //正则表达式
        let emojiPattern = "\\[.*?\\]"
        //创建正则表达式对象
        let regex = try! NSRegularExpression(pattern: emojiPattern, options: [])
        // 开始匹配，返回匹配的结果
        let result = regex.matches(in: content, options: [], range: NSMakeRange(0, content.count))
        
        if result.count != 0 {
            
            // stride 可以按照
            for index in stride(from: result.count - 1, through: 0, by: -1) {
                
                
            }
            
        }
        
        return attributedString;
    }
}

