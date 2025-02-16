//
//  Post.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/13.
//

import SwiftUI

// MARK: - 贴子数据模型
struct Post: Identifiable {
    
    let id = UUID()
    let user: (name: String, avatar: String)
    let headline: String?
    let content: String
    let images: [String]
    let topic: String
    var isLiked: Bool
    var likeCount: Int
    var commentCount: Int
    let timeStr: String
    let locationStr: String
}
