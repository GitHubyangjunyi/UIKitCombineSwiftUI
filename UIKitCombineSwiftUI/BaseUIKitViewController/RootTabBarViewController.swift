//
//  RootTabBarViewController.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import UIKit

// MARK: - 根视图控制器
class RootTabBarViewController: UITabBarController {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print(String.init(describing: type(of: self)).appending(" deinit"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
    }
}
