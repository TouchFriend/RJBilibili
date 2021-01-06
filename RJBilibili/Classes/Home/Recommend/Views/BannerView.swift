//
//  BannerView.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/6.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit
import FSPagerView
import SnapKit

private let CellID = "FSPagerViewCell"

class BannerView: UIView {

    private var pagerView: FSPagerView!
    private var pageControl: FSPageControl!
    var imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Init
    
    private func setupInit() {
        backgroundColor = .white
        
        pagerView = FSPagerView()
        addSubview(pagerView)
        pagerView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        pagerView.automaticSlidingInterval = 2.0
        pagerView.isInfinite = true
        pagerView.removesInfiniteLoopForSingleItem = true
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: CellID)
        
        pageControl = FSPageControl()
        addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(25.0)
        }
        pageControl.numberOfPages = imageNames.count
        pageControl.currentPage = 0
        pageControl.contentHorizontalAlignment = .right
        pageControl.contentInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }

}

// MARK: - FSPagerViewDataSource

extension BannerView: FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let imageName = imageNames[index]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: CellID, at: index)
        cell.imageView?.image = UIImage(named: imageName)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.textLabel?.text = "\(index)\(index)"
        return cell
    }
    
}

// MARK: - FSPagerViewDelegate

extension BannerView: FSPagerViewDelegate {
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
}
