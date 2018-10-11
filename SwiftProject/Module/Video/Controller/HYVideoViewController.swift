//
//  HYVideoViewController.swift
//  Token_Swift
//
//  Created by Duntech on 2018/8/23.
//  Copyright © 2018年 Duntech. All rights reserved.
//

import UIKit

class HYVideoViewController: HYBaseViewController {
    
    
    lazy var collectionView : UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        let itemWidth : CGFloat = (kScreenWidth - kAdaptedWidth(20)) / 2
        let itemHeight : CGFloat = itemWidth * (kScreenHeight / kScreenWidth)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        flowLayout.sectionInset = UIEdgeInsets(top: kAdaptedWidth(5), left: kAdaptedWidth(5), bottom: kAdaptedWidth(5), right: kAdaptedWidth(5))
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: UICollectionViewCell.className())
        return collectionView
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupSubview()
        setupMasonryLayout()
    }
    
    func setupSubview() {
        
        self.view.addSubview(self.collectionView)
    }
    
    func setupMasonryLayout() {
        
        self.collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}

extension HYVideoViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    // MARK: - DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className(), for: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
