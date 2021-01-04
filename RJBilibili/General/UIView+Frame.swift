//
//  UIView+Frame.swift
//  RJBilibili
//
//  Created by TouchWorld on 2021/1/4.
//  Copyright © 2021 RJSoft. All rights reserved.
//

import UIKit

extension UIView {
    
    var x: Double {
        get {
            return self.frame.origin.x.native
        }
        set {
            self.frame.origin.x = CGFloat(newValue)
        }
    }
    
    var y: Double {
        get {
            return self.frame.origin.y.native
        }
        set {
            self.frame.origin.y = CGFloat(newValue)
        }
    }
    
    var width: Double {
        get {
            return self.frame.size.width.native
        }
        set {
            self.frame.size.width = CGFloat(newValue)
        }
    }
    
    var height: Double {
        get {
            return self.frame.size.height.native
        }
        set {
            self.frame.size.height = CGFloat(newValue)
        }
    }
    
}
