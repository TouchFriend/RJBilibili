//
//  RJMyViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit
import SnapKit

private let RJServeCellID = "RJServeCollectionViewCell"
let RJScreenWidth = {
    UIScreen.main.bounds.size.width.native
}()
let RJScreenHeight = {
    UIScreen.main.bounds.size.height.native
}()

class RJMyViewController: UIViewController {

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
            make.top.left.right.equalToSuperview()
            make.height.equalTo((200.0))
        }
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize.zero
        
        let serveCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        view.addSubview(serveCollectionView)
        serveCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        self.serveCollectionView = serveCollectionView
        serveCollectionView.backgroundColor = .white
        serveCollectionView.showsHorizontalScrollIndicator = false
        serveCollectionView.dataSource = self
        serveCollectionView.delegate = self
        serveCollectionView.register(RJServeCollectionViewCell.self, forCellWithReuseIdentifier: RJServeCellID)
    }

}

// MARK: - UICollectionViewDataSource

extension RJMyViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RJServeCellID, for: indexPath) as! RJServeCollectionViewCell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RJMyViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (RJScreenWidth - maxInteritemSpacing * 3.0) / 4.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
