//
//  HomeViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit
import JXSegmentedView
import SnapKit

class HomeViewController: UIViewController {
    
    var segmentedView: JXSegmentedView!
    var segmentedDataSource: JXSegmentedTitleDataSource!
    var segmentedIndicator: JXSegmentedIndicatorLineView!
    var listContainerView: JXSegmentedListContainerView!
    var titles = ["直播", "推荐", "热门", "追番", "影视", "跨晚", "抗击疫情", "小康"]
    lazy var viewLists: [JXSegmentedListContainerViewListDelegate] = {
        var viewLists = [JXSegmentedListContainerViewListDelegate]()
        let rVC = RecommendViewController()
        viewLists.append(rVC)
        let count = titles.count - viewLists.count
        for _ in 0..<count {
            let viewList = HotViewController()
            viewLists.append(viewList)
        }
        return viewLists
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInit()
    }
    
// MARK: - Setup Init
    
    func setupInit() {
        view.backgroundColor = .white
        
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.titles = titles
        segmentedDataSource.titleNormalColor = .black
        segmentedDataSource.titleSelectedColor = .systemPink
        segmentedDataSource.titleNormalFont = UIFont.systemFont(ofSize: 15.0)
        segmentedDataSource.titleSelectedFont = UIFont.boldSystemFont(ofSize: 16.0)
        
        segmentedIndicator = JXSegmentedIndicatorLineView()
        
        segmentedView = JXSegmentedView()
        view.addSubview(segmentedView)
        segmentedView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44.0)
        }
        segmentedView.delegate = self
        segmentedView.dataSource = segmentedDataSource
        segmentedView.indicators = [segmentedIndicator]
        
        listContainerView = JXSegmentedListContainerView(dataSource: self, type: .collectionView)
        view.addSubview(listContainerView)
        listContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        segmentedView.listContainer = listContainerView
    }
    
}

// MARK: - JXSegmentedViewDelegate

extension HomeViewController: JXSegmentedViewDelegate {
    
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, canClickItemAt index: Int) -> Bool {
        return true
    }
}

// MARK: - JXSegmentedListContainerViewDataSource

extension HomeViewController: JXSegmentedListContainerViewDataSource {
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return viewLists.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        let viewList: JXSegmentedListContainerViewListDelegate = viewLists[index]
        return viewList
    }
    
    
}
