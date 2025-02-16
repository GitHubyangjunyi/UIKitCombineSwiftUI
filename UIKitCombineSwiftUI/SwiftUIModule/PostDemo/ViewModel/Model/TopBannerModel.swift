//
//  TopBannerModel.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 贴子数据模型
struct TopBannerModel: Identifiable, Hashable {
    
    let id = UUID()
    let title: String
    let imageURL: String
}
