//
//  RecommendCollectionViewCell.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/11.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupInit
    
    private func setupInit() {
        contentView.backgroundColor = .orange
        layer.cornerRadius = 6.0
        layer.masksToBounds = true
    }
}
