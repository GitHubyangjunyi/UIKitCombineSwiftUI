//
//  LoadingPlaceholderModifier.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 监听某个属性是否为空添加转圈动画
struct LoadingPlaceholderModifier<T>: ViewModifier {
    
    let property: T?
    let width: CGFloat
    let height: CGFloat
    
    init(property: T?, width: CGFloat, height: CGFloat) {
        self.property = property
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        ZStack {
            if property != nil {
                content
            } else {
                ProgressView()
                    .frame(width: width, height: height)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
        }
    }
}

extension View {
    func loadingPlaceholder<T>(for property: T?, width: CGFloat, height: CGFloat) -> some View {
            self.modifier(LoadingPlaceholderModifier(property: property, width: width, height: height))
        }
}
