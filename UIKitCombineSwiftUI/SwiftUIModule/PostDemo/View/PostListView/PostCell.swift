//
//  PostCell.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/13.
//

import SwiftUI
import AppleDarthVader

// MARK: - 贴子单元格
struct PostCell: View {
    
    let post: Post?
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10) {
                if let post {
                    // MARK: - 头像关注区域
                    HStack {
                        Image(post.user.avatar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .onTapGesture {
                                print("点击头像，进入 \(post.user.name) 主页")
                            }
                        
                        Text(post.user.name)
                            .font(.system(size: 16, weight: .bold))
                        
                        Spacer()
                        Button(action: {
                            print("\(post.user.name) 被关注")
                        }) {
                            Text("关注")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                                .padding(.vertical, 5)
                                .padding(.horizontal, 16)
                                .cornerRadius(10)
                        }
                        .background {
                            ZStack {
                                CustomBorderShape()
                                    .stroke(.black, lineWidth: 1)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading) {
                        if (post.headline?.count ?? 0 > 0) {
                            Text(post.headline ?? "")
                                .lineLimit(1)
                                .font(.headline)
                                .foregroundStyle(.black)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .padding(.vertical, 4)
                        }
                        Text(post.content)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .lineLimit(3)
                    }
                    
                    // MARK: - 图片布局区域
                    let screenWidth = UIScreen.main.bounds.width
                    switch post.images.count {
                    case 3:
                        HStack(alignment: .top, spacing: 10) {
                            let allSpacing: CGFloat = 30
                            let largeImageWidth = (screenWidth - allSpacing) * 0.6
                            let smallImageWidth = (screenWidth - allSpacing) * 0.4
                            
                            Image(post.images[0])
                                .resizable()
                                .scaledToFill()
                                .frame(width: largeImageWidth, height: smallImageWidth * 2 + 10)
                                .clipped()
                                .cornerRadius(10)
                            
                            VStack(spacing: 10) {
                                Image(post.images[1])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: smallImageWidth, height: smallImageWidth)
                                    .clipped()
                                    .cornerRadius(10)
                                Image(post.images[2])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: smallImageWidth, height: smallImageWidth)
                                    .clipped()
                                    .cornerRadius(10)
                            }
                        }
                        .overlay(alignment: .bottomTrailing) {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.6))
                                    .frame(width: 28, height: 28)
                                Text("\(post.images.count)")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .offset(x: -10, y: -15)
                        }
                        .onTapGesture {
                            print("点击图片区域")
                        }
                    case 2:
                        HStack(alignment: .top, spacing: 10) {
                            let imageWidth = (UIScreen.main.bounds.width - 30) / 2
                            Image(post.images[0])
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageWidth, height: imageWidth)
                                .clipped()
                                .cornerRadius(10)
                            
                            Image(post.images[1])
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageWidth, height: imageWidth)
                                .clipped()
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            print("点击图片区域")
                        }
                    case 1:
                        Image(post.images[0])
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: screenWidth, maxHeight: screenWidth)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                print("点击图片区域")
                            }
                    default:
                        EmptyView()
                    }
                    
                    // MARK: - 底部区域
                    VStack(alignment: .leading) {
                        Button(action: {
                            print("点击话题: \(post.topic)")
                        }) {
                            Text(post.topic)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.orange)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .cornerRadius(10)
                        }
                        HStack(alignment: .center) {
                            Text(post.timeStr)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                            Text(post.locationStr)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Button {
                                    print("点击评论按钮")
                                } label: {
                                    HStack {
                                        Image(systemName: "message")
                                        Text("\(post.commentCount)")
                                    }
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                }
                                
                                Button {
                                    print("点击点赞按钮")
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: post.isLiked ? "heart.fill" : "heart")
                                            .foregroundColor(post.isLiked ? .red : .gray)
                                        Text("\(post.likeCount)")
                                            .foregroundStyle(.gray)
                                    }
                                    .font(.system(size: 14))
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        Divider()
                            .padding(.horizontal, 10)
                    }
                }
            }
            .loadingPlaceholder(for: post, width: UIScreen.screenSize.width - 20, height: UIScreen.screenSize.width)
            .contentShape(Rectangle())
            .onTapGesture {
                print("点击帖子区域")
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    var post = staticPosts[0]
    PostCell(post: staticPosts[1])
}
