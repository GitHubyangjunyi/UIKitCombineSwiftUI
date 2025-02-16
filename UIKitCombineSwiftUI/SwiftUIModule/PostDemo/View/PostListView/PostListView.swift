//
//  PostListView.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/13.
//

import SwiftUI

// MARK: - 最新帖子视图
struct PostListView: View {
    
    @StateObject var bannerViewModel = TopBannerViewModel()
    @ObservedObject var postViewModel = PostViewModel()
    
    @State private var isPresentedAllChat = false // 是否跳转到大家都在聊页面
    
    // MARK: - 导航跳转
    @State var bannerPath: [TopBannerModel] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: - 顶部大家都在聊按钮-->
                HStack {
                    Button {
                        isPresentedAllChat.toggle()
                    } label: {
                        Text("大家都在聊")
                            .font(.system(size: 16, weight: .bold))
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.gray)
                    }
                    .foregroundStyle(.black)
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 10)
                .navigationDestination(isPresented: $isPresentedAllChat) {
                    AllChatView()
                }
                
                // MARK: - 顶部Banner
                ScrollView(.horizontal) {
                    LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 40), count: 1)) {
                        ForEach(bannerViewModel.banners.indices, id: \.self) { index in
                            let banners = bannerViewModel.banners[index]
                            NavigationLink(value: banners) {
                                BannerCellView(banner: banners)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                }
                .navigationDestination(for: TopBannerModel.self) { banner in
                    BanerDetailView(banner: banner)
                }
                
                // MARK: - 最新帖子部分
                VStack(alignment: .leading) {
                    Text("最新")
                        .offset(x: 10)
                        .padding(.vertical, 10)
                        .font(.system(size: 16, weight: .bold))
                    
                    LazyVStack(spacing: 25) {
                        ForEach(postViewModel.posts.indices, id: \.self) { index in
                            let post = postViewModel.posts[index]
                            PostCell(post: post)
                        }
                    }
                }
            }
            .refreshable {
                await bannerViewModel.refreshData()
                await postViewModel.refreshData()
            }
        }
        .navigationTitle("最新帖子")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await bannerViewModel.refreshData()
            await postViewModel.refreshData()
        }
    }
}

#Preview {
    PostListView()
}
