//
//  RJServeCollectionHeaderView.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/29.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit

class RJServeCollectionHeaderView: UICollectionReusableView {
    
    private var titleLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupInit
    
    private func setupInit() {
        self.backgroundColor = .white
        
        titleLbl = UILabel()
        self.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(10.0)
            make.centerY.equalToSuperview()
            make.right.lessThanOrEqualToSuperview().offset(-10.0)
        }
        titleLbl.text = "创作中心"
        titleLbl.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        titleLbl.textColor = .black
    }
}
