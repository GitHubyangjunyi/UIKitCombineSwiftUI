//
//  BaseViewController.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import UIKit

// MARK: - 视图控制器基类
class BaseViewController: UIViewController {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print(String.init(describing: type(of: self)).appending(" deinit"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
