//
//  RecommendViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/6.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit
import JXSegmentedView


class RecommendViewController: BaseViewController {

    var banner: BannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInit()
    }
    
    // MARK: - Setup Init
    
    func setupInit() {
        view.backgroundColor = .white
        
        setupBanner()
    }
    
    func setupBanner() {
        banner = BannerView()
        view.addSubview(banner)
        banner.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(banner.snp.width).multipliedBy(0.55)
        }
    }

}

// MARK: - JXSegmentedListContainerViewListDelegate

extension RecommendViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        return self.view
    }
    
    
}
