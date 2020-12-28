//
//  RJMyViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit
import SnapKit

class RJMyViewController: UIViewController {

    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .orange
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInit()
    }
    
// MARK: - SetupInit
    
    func setupInit() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                // Fallback on earlier versions
                make.top.equalTo(self.topLayoutGuide.snp.top)
            }
            make.top.left.right.equalTo(view)
            make.height.equalTo((200.0))
        }
    }

}
