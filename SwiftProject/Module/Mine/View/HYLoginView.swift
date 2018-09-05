//
//  HYLoginView.swift
//  Token_Swift
//
//  Created by 胡勇 on 2018/7/11.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit
import YYKit
import SnapKit
import Kingfisher

class HYLoginView: UIView {

    lazy var headerImgView : UIImageView = {
        
        let headerImgView = UIImageView()
        headerImgView.backgroundColor = UIColor.gray
        headerImgView.contentMode = .scaleAspectFill
        headerImgView.clipsToBounds = true
        return headerImgView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        let bgImageView : UIImageView = UIImageView(frame: self.bounds)
        bgImageView.backgroundColor = UIColor.orange
        addSubview(bgImageView)
        addSubview(headerImgView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        headerImgView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.width.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(100)
        }
        
        headerImgView.kf.setImage(with: URL(string: "https://upload-images.jianshu.io/upload_images/3094613-e4b1c7551e716364.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/700"),placeholder: UIImage(named: ""))
        
        self.layoutIfNeeded()
        headerImgView.layer.cornerRadius = headerImgView.frame.size.width / 2
    }
}
