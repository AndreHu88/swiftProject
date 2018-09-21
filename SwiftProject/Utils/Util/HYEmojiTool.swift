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
            
            //插入一个删除
            if index != 0 && index % 20 == 0 {
                tempArray.append(Emoji(isDelete: true))
            }
        }
        
    }
}

