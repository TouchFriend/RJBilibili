//
//  RecommendViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/6.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit
import JXSegmentedView
import MJRefresh
import EmptyDataSet_Swift

private let RecommendCellID = "RecommendCollectionViewCell"
private let RecommendHeaderViewID = "RecommendCollectionHeaderView"
private let MaxInteritemSpacing = 10.0

class RecommendViewController: BaseViewController {

    var recommendCollectionView: UICollectionView!
    weak var recommendHeaderView: RecommendCollectionHeaderView?
    var titles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInit()
    }
    
    // MARK: - Setup Init
    
    private func setupInit() {
        view.backgroundColor = .white
        
        setupCollectionView()

    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize.zero
        flowLayout.sectionInset = UIEdgeInsets(top: 0.0, left: CGFloat(MaxInteritemSpacing), bottom: 0.0, right: CGFloat(MaxInteritemSpacing))
        
        recommendCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        view.addSubview(recommendCollectionView)
        recommendCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        recommendCollectionView.backgroundColor = .white
        recommendCollectionView.showsHorizontalScrollIndicator = false
        recommendCollectionView.dataSource = self
        recommendCollectionView.delegate = self
        recommendCollectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCellID)
        recommendCollectionView.register(RecommendCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendHeaderViewID)
        recommendCollectionView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        recommendCollectionView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { [weak self] in
            guard let self = self else {
                return
            }
            
            self.loadMoreData()
        })
        recommendCollectionView.mj_footer?.ignoredScrollViewContentInsetBottom = 44.0
        let emptyClosure = EmptyViewHelper.recommendEmptyViewConfiguration { [weak self] in
            guard let self = self else {
                return
            }
            
            self.loadNewData()
        }
        recommendCollectionView.emptyDataSetView(emptyClosure)
    }
    
    

}

// MARK: - Network

extension RecommendViewController {
    
    @objc func loadNewData() {
        recommendCollectionView.mj_header?.endRefreshing()
        titles.removeAll()
        for i in 0..<10 {
            titles.append(String(i))
        }
        recommendCollectionView.reloadData()
    }
    
    func loadMoreData() {
        recommendCollectionView.mj_footer?.endRefreshing()
        let count = titles.count
        for i in count..<(count + 10) {
            titles.append(String(i))
        }
        recommendCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension RecommendViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return titles.count > 0 ? 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCellID, for: indexPath) as! RecommendCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendHeaderViewID, for: indexPath) as! RecommendCollectionHeaderView
            recommendHeaderView = headerView
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (ScreenWidth - MaxInteritemSpacing * 3) * 0.5
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: CGFloat(ScreenWidth), height: CGFloat(ScreenWidth * 0.55))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
}

// MARK: - JXSegmentedListContainerViewListDelegate

extension RecommendViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        return self.view
    }
    
    
}
