//
//  RJServeCollectionViewCell.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/29.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit

class RJServeCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInit() {
        print(RJScreenWidth)
        contentView.backgroundColor = .green
    }
}
