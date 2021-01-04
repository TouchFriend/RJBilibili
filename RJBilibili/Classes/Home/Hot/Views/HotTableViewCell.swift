//
//  HotTableViewCell.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/4.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit

class HotTableViewCell: UITableViewCell {
    
    var iconImageV: UIImageView!
    var titleLbl: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Init
    
    func setupInit() {
        contentView.backgroundColor = .white
        
        let icon = UIImage(named: "test")
        iconImageV = UIImageView(image: icon)
        contentView.addSubview(iconImageV)
        iconImageV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.equalToSuperview().offset(10.0)
            make.bottom.equalToSuperview().offset(-10.0)
            make.width.equalTo(160.0)
        }
        iconImageV.layer.cornerRadius = 4.0
        iconImageV.layer.masksToBounds = true
        
        titleLbl = UILabel(frame: CGRect.zero)
        contentView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageV.snp.top)
            make.left.equalTo(iconImageV.snp.right).offset(10.0)
            make.right.lessThanOrEqualToSuperview().offset(-10.0)
        }
        titleLbl.text = "标题"
    }

}
