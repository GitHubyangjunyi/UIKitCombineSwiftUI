//
//  AllChatView.swift
//  AISwiftUIQuickTest
//
//  Created by 杨俊艺 on 2025/2/15.
//

import SwiftUI

// MARK: - 大家都在聊页面
struct AllChatView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("大家都在聊页面")
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
        AllChatView()
    }
}
