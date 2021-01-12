//
//  EmptyViewHelper.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/12.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift

class EmptyViewHelper: NSObject {
    
    static func recommendEmptyViewConfiguration(didTapDataButton: @escaping () -> Void) -> (EmptyDataSetView) -> Void {
        let emptyClosure = { (emptyView: EmptyDataSetView) in
            let titleAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)
            ]
            let buttonTitleAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)
            ]
            emptyView.image(UIImage(named: "icon_safari"))
                .titleLabelString(NSAttributedString(string: "页面加载失败，请重试", attributes: titleAttributes))
                .buttonTitle(NSAttributedString(string: "刷新一下", attributes: buttonTitleAttributes), for: .normal)
                .isScrollAllowed(true)
                .verticalSpace(40.0)
                .verticalOffset(-40.0)
                .didTapDataButton {
                    didTapDataButton()
                }
        }
        return emptyClosure
    }
}
