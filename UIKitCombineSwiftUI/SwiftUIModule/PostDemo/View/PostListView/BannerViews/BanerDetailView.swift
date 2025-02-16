//
//  BanerDetailView.swift
//  UIKitCombineSwiftUI
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 最新帖子轮播图详情页面
struct BanerDetailView: View {
    
    var banner: TopBannerModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Banner详情页面")
            VStack(alignment: .center) {
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        BanerDetailView(banner: .init(title: "iCAR情人节真爱有礼", imageURL: "image1"))
    }
}
