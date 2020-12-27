//
//  RJMainTabBarViewController.swift
//  RJBilibili
//
//  Created by TouchWorld on 2020/12/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

import UIKit

fileprivate let ViewControllerName = "ViewControllerName"
fileprivate let TabBarItemTitle = "TabBarItemTitle"
fileprivate let TabBarItemImage = "TabBarItemImage"

class RJMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupInit()
    }
    
    // MARK: - SetupInit
    func setupInit() {
        self.view.backgroundColor = .white
        var viewControllers = [UIViewController]()
        for tabBarItemData in tabBarItemDatas {
            let viewControllerName = tabBarItemData[ViewControllerName]!
            let title = tabBarItemData[TabBarItemTitle]!
            let imageName = tabBarItemData[TabBarItemImage]!
            let navigationController = self.getNavigationController(viewControllerName: viewControllerName, title: title, imageName: imageName)
            viewControllers.append(navigationController)
        }
        self.viewControllers = viewControllers
    }
    
    func getNavigationController(viewControllerName: String, title: String, imageName: String) -> UINavigationController {
        let image = UIImage(named: imageName)
        let selectedImage = UIImage(named: imageName + "-hover")
        let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        // 获取工程名
        let workName = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let viewControllerClass = NSClassFromString("\(workName).\(viewControllerName)") as! UIViewController.Type
        let viewController: UIViewController = viewControllerClass.init()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }

}

extension RJMainTabBarViewController {
    var tabBarItemDatas: Array<Dictionary<String, String>> {
        let datas = [
            [
                ViewControllerName: "RJHomeViewController",
                TabBarItemTitle: "首页",
                TabBarItemImage: "RJPortal-tabbar-home"
            ],
            [
                ViewControllerName: "RJChannelViewController",
                TabBarItemTitle: "频道",
                TabBarItemImage: "RJPortal-tabbar-home"
            ],
            [
                ViewControllerName: "RJTrendViewController",
                TabBarItemTitle: "动态",
                TabBarItemImage: "RJPortal-tabbar-home"
            ],
            [
                ViewControllerName: "RJShoppingViewController",
                TabBarItemTitle: "会员购",
                TabBarItemImage: "RJPortal-tabbar-home"
            ],
            [
                ViewControllerName: "RJMyViewController",
                TabBarItemTitle: "我的",
                TabBarItemImage: "RJPortal-tabbar-home"
            ]
        ]
        return datas
    }
}
