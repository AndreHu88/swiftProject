//
//  HYHomeTableViewCell.swift
//  SwiftProject
//
//  Created by Duntech on 2018/9/6.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYHomeTableViewCell: UITableViewCell {
    
    
    
    lazy var titleLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = kAppTableViewSeperatorColor
        return titleLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension HYHomeTableViewCell {
    

    func setupSubviews() {
        
        self.addSubview(titleLabel)
        
    }
    
    override func layoutSubviews() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(20)
            make.height.equalTo(40)
        }
    }
    
}
