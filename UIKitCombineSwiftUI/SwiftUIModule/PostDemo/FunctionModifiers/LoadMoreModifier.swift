//
//  LoadMoreModifier.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - ScrollView 上拉加载扩展
struct LoadMoreModifier: ViewModifier {
    
    let action: () async -> Void
    @State private var isLoading = false

    func body(content: Content) -> some View {
        content
            .background(GeometryReader { geo in
                Color.clear
                    .preference(key: ScrollOffsetKey.self, value: geo.frame(in: .global).minY)
            })
            .onPreferenceChange(ScrollOffsetKey.self) { newOffset in
                if newOffset < -50, !isLoading {
                    Task {
                        await MainActor.run { isLoading = true }
                        await action()
                        await MainActor.run { isLoading = false }
                    }
                }
            }
    }
}

// MARK: - 监听滚动偏移量的 PreferenceKey
struct ScrollOffsetKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - ScrollView 上拉加载扩展方法
extension View {
    func onLoadMore(_ action: @escaping () async -> Void) -> some View {
        modifier(LoadMoreModifier(action: action))
    }
}
