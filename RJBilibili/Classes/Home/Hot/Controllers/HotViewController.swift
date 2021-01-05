//
//  HotViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/4.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit
import JXSegmentedView
import MJRefresh

private let CellID = "HotTableViewCell"
private let HeaderViewID = "HotTableViewHeaderView"

class HotViewController: UIViewController {

    private var hotTableView: UITableView!
    private lazy var titles: [String] = {
        var titles = [String]()
        for i in 0..<10 {
            titles.append(String(i))
        }
        return titles
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInit()
    }
    
    // MARK: - Setup Init
    
    private func setupInit() {
        view.backgroundColor = .white
        
        setupTableView()
    }
    
    private func setupTableView() {
        hotTableView = UITableView(frame: CGRect.zero, style: .grouped)
        view.addSubview(hotTableView)
        hotTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        hotTableView.backgroundColor = .white
        hotTableView.estimatedRowHeight = 0.0
        hotTableView.estimatedSectionHeaderHeight = 0.0
        hotTableView.estimatedSectionFooterHeight = 0.0
        hotTableView.separatorInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
        hotTableView.showsHorizontalScrollIndicator = false
        hotTableView.dataSource = self
        hotTableView.delegate = self
        hotTableView.register(HotTableViewCell.self, forCellReuseIdentifier: CellID)
        hotTableView.register(HotTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderViewID)
        hotTableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        hotTableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { [weak self] in
            guard let self = self else {
                return
            }
            
            self.loadMoreData()
        })
        hotTableView.mj_footer?.ignoredScrollViewContentInsetBottom = 44.0
    }
    
}

// MARK: - Network

extension HotViewController {
    
    @objc func loadNewData() {
        hotTableView.mj_header?.endRefreshing()
        titles.removeAll()
        for i in 0..<10 {
            titles.append(String(i))
        }
        hotTableView.reloadData()
    }
    
    func loadMoreData() {
        hotTableView.mj_footer?.endRefreshing()
        let count = titles.count
        for i in count..<(count + 10) {
            titles.append(String(i))
        }
        hotTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension HotViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = titles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! HotTableViewCell
        cell.title = title
        cell.iconName = "test"
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension HotViewController: UITableViewDelegate {
    
    func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewID) as! HotTableViewHeaderView
        return headerView
    }
}

// MARK: - JXSegmentedListContainerViewListDelegate

extension HotViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        return self.view
    }
    
    
}
