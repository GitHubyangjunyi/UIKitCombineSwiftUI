//
//  BannerCellView.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 最新帖子顶部Banner位单元格
struct BannerCellView: View {
    
    var banner: TopBannerModel?
    
    var body: some View {
        VStack(alignment: .center) {
            if let banner {
                Image(banner.imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 90)
                    .clipped()
                    .cornerRadius(10)
                Text(banner.title)
                    .foregroundStyle(.black)
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .loadingPlaceholder(for: banner, width: 160, height: 112)
    }
}

#Preview {
    BannerCellView(banner: .init(title: "iCAR情人节真爱有礼", imageURL: "image1"))
}
