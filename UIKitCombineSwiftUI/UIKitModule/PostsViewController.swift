//
//  PostsViewController.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import UIKit
import SwiftUI

class PostsViewController: BaseSwiftUIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIDebugView()
    }
    
    private func setupSwiftUIDebugView() {
        let swiftUIView = PostListView()
        let hostController = UIHostingController(rootView: swiftUIView)
        let size = UIScreen.main.bounds.size
        hostController.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        addChild(hostController)
        view.addSubview(hostController.view)
        hostController.didMove(toParent: self)
    }
}
