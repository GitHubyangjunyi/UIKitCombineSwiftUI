//
//  PostViewModel.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 最新帖子视图的ViewModel
class PostViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var posts: [Post?] = Array(repeating: nil, count: 2)
    
    // MARK: - 模拟刷新帖子数据
    func refreshData() async {
        guard !isLoading else { return }
        await MainActor.run { isLoading = true }
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let newPosts = (1...3).map { index in
                Post(user: ("NewUser\(index)", "image\(index)"),
                     headline: "",
                     content: "传统的 \(Int.random(in: 1...3000))极端，一带保有弹性，使得\(Int.random(in:1...3000))极端创作者可以“保留部分权利知识共享提供多种可供选择的授权形享创作，授予其他代知识产权以及版权法在信息共",
                     images: (1...Int.random(in: 1...3)).map { "image\($0)" },
                     topic: ["#科技", "#摄影", "#生活"].randomElement()!,
                     isLiked: false,
                     likeCount: Int.random(in: 0...100),
                     commentCount: Int.random(in: 0...20),
                     timeStr: "\(Int.random(in: 0...20))小时前", locationStr: "芜湖.弋江区")
            }
            await MainActor.run {
                isLoading = false
                posts = newPosts
            }
        } catch {
            await MainActor.run { isLoading = false }
        }
    }
    
    // MARK: - 模拟加载更多帖子数据
    func laodMoreData() async {
        guard !isLoading else { return }
        await MainActor.run { isLoading = true }
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let newPosts = (1...3).map { index in
                Post(user: ("NewUser\(index)", "image\(index)"),
                     headline: "",
                     content: "传统的 \(Int.random(in: 1...3000))极端，一带保有弹性，使得\(Int.random(in:1...3000))极端创作者可以“保留部分权利知识共享提供多种可供选择的授权形享创作，授予其他代知识产权以及版权法在信息共",
                     images: (1...Int.random(in: 1...3)).map { "image\($0)" },
                     topic: ["#科技", "#摄影", "#生活"].randomElement()!,
                     isLiked: false,
                     likeCount: Int.random(in: 0...100),
                     commentCount: Int.random(in: 0...20),
                     timeStr: "\(Int.random(in: 0...20))小时前", locationStr: "芜湖.弋江区")
            }
            await MainActor.run {
                isLoading = false
                posts.append(contentsOf: newPosts)
            }
        } catch {
            await MainActor.run { isLoading = false }
        }
    }
}
