//
//  HotTableViewHeaderView.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/4.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit

class HotTableViewHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Init
    
    func setupInit() {
        contentView.backgroundColor = .orange
    }
    
}
