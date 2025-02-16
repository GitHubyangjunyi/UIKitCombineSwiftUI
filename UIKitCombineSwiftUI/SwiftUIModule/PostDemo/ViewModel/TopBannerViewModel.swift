//
//  TopBannerViewModel.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 热门Banner话题的ViewModel
class TopBannerViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var banners: [TopBannerModel?] = Array(repeating: nil, count: 4)
    
    // MARK: - 模拟刷新Banner数据
    func refreshData() async {
        guard !isLoading else { return }
        await MainActor.run { isLoading = true }
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let newBanners = (1...3).map { index in
                TopBannerModel(title: "title\(index)", imageURL: "image\(index)")
            }
            await MainActor.run {
                isLoading = false
                banners = newBanners
            }
        } catch {
            await MainActor.run { isLoading = false }
        }
    }
    
    // MARK: - 模拟加载Banner数据
    func loadMoreData() async {
        guard !isLoading else { return }
        await MainActor.run { isLoading = true }
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            let newBanners = (1...3).map { index in
                TopBannerModel(title: "title\(index)", imageURL: "image\(index)")
            }
            await MainActor.run {
                isLoading = false
                banners.append(contentsOf: newBanners)
            }
        } catch {
            await MainActor.run { isLoading = false }
        }
    }
}
