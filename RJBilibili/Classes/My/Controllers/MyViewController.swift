//
//  MyViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit
import SnapKit

private let ServeCellID = "ServeCollectionViewCell"
private let ServeHeaderID = "ServeCollectionHeaderView"

class MyViewController: UIViewController {

    private lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .orange
        return headerView
    }()
    
    private var serveCollectionView: UICollectionView!
    
    private let maxInteritemSpacing = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInit()
    }
    
    // MARK: - SetupInit
    
    private func setupInit() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                // Fallback on earlier versions
                make.top.equalTo(self.topLayoutGuide.snp.top)
            }
            make.left.right.equalToSuperview()
            make.height.equalTo((200.0))
        }
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize.zero
        flowLayout.sectionInset = UIEdgeInsets.zero
        
        serveCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        view.addSubview(serveCollectionView)
        serveCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        serveCollectionView.backgroundColor = .white
        serveCollectionView.showsHorizontalScrollIndicator = false
        serveCollectionView.dataSource = self
        serveCollectionView.delegate = self
        serveCollectionView.register(ServeCollectionViewCell.self, forCellWithReuseIdentifier: ServeCellID)
        serveCollectionView.register(ServeCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ServeHeaderID)
    }

}

// MARK: - UICollectionViewDataSource

extension MyViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServeCellID, for: indexPath) as! ServeCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ServeHeaderID, for: indexPath) as! ServeCollectionHeaderView
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MyViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (ScreenWidth - maxInteritemSpacing * 3.0) / 4.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0.0, height: 40.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    
}
