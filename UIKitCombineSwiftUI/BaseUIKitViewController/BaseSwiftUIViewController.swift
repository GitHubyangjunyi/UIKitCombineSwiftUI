//
//  BaseSwiftUIViewController.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import UIKit
import SwiftUI

// MARK: - SwiftUI桥接控制器基类
class BaseSwiftUIViewController: UIViewController {

    deinit {
        NotificationCenter.default.removeObserver(self)
        print(String.init(describing: type(of: self)).appending(" deinit"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.tabBarItem = .init(title: "SwiftUI", image: .init(systemName: "heart"), selectedImage: .init(systemName: "heart.fill"))
    }
    
    private func setupSwiftUIView() {
        let swiftUIView = EmptyView()
        let hostController = UIHostingController(rootView: swiftUIView)
        let size = UIScreen.main.bounds.size
        hostController.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        addChild(hostController)
        view.addSubview(hostController.view)
        hostController.didMove(toParent: self)
    }
}
