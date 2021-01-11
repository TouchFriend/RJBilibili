//
//  RecommendCollectionHeaderView.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/11.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit

class RecommendCollectionHeaderView: UICollectionReusableView {
    
    var banner: BannerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupInit
    
    private func setupInit() {
        backgroundColor = .clear
        
        setupBanner()
    }
    
    private func setupBanner() {
        banner = BannerView()
        addSubview(banner)
        banner.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0))
        }
        banner.layer.cornerRadius = 6.0
        banner.layer.masksToBounds = true
    }
}
