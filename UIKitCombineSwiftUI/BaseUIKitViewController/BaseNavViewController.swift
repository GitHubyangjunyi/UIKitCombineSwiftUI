//
//  BaseNavViewController.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import UIKit

// MARK: - 导航栏控制器基类
class BaseNavViewController: UINavigationController {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print(String.init(describing: type(of: self)).appending(" deinit"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
