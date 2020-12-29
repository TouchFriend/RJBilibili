//
//  RJServeCollectionViewCell.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/29.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit
import Kingfisher

class RJServeCollectionViewCell: UICollectionViewCell {
    
    private var titleLbl: UILabel!
    private var iconImageV: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupInit
    
    private func setupInit() {
        contentView.backgroundColor = .white
        
        iconImageV = UIImageView()
        self.addSubview(iconImageV)
        iconImageV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15.0)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 40.0, height: 40.0))
        }
        iconImageV.contentMode = .scaleAspectFill
        let url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher-2.jpg")
        iconImageV.kf.indicatorType = .activity
        iconImageV.kf.setImage(with: url, placeholder: UIImage(named: "test"), options: [.transition(.fade(1.0))]) { (receivedSize, totalSize) in
//            print("\(receivedSize)/\(totalSize)")
        } completionHandler: { (result) in
//            print(result)
        }

        titleLbl = UILabel()
        self.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageV.snp.bottom).offset(5.0)
            make.left.right.equalToSuperview()
        }
        titleLbl.text = "创作首页"
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        titleLbl.textColor = .black
    }
}
