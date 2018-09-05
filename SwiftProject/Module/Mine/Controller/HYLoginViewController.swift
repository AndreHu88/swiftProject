//
//  HYLoginViewController.swift
//  Token_Swift
//
//  Created by 胡勇 on 2018/7/11.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit


class HYLoginViewController: HYBaseViewController {
    
    var loginView = HYLoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView = HYLoginView(frame: self.view.bounds)
        self.view.addSubview(loginView)
        
        DouBanProvider.request(.newsTitle) { result in
            
            do{
                
                let response = try result.dematerialize()
                let mapJson = try response.mapJSON()
                print(mapJson)
                if let jsonDict : Dictionary =  mapJson as? Dictionary<String, Any>{
                    
                    
                }
            }
            catch{
                
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

struct BlackJackCard {
    
    enum Suit : Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank : Int {
        
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            
            let first : Int
            let second : Int?
        }
        
        var values : Values{
            
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    
    }
    
    let  suit : Suit, rank : Rank
    var description : String{
        
        var outPut = "suit is \(suit.rawValue)"
        outPut += " value is \(rank.values.first)"
        if let second = rank.values.second{
            outPut += " or \(second)"
        }
        return outPut
    }
    
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct MyRect {
    
    var size = Size()
    var origin = Point()
    var center : Point {
        get{
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter){
            origin.x = newCenter.x  - size.width / 2
            origin.y = newCenter.y - size.height / 2
        }
    }
    
}
