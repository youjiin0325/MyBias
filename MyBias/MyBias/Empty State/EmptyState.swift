//
//  EmptyStateView.swift
//  MyBias
//
//  Created by 유지인 on 2/7/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName:String
    let message:String
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y:-50)
        }
    }
}

#Preview {
    EmptyState(imageName: "emptyImage", message: "기본 이미지 입니다. 이것은 나중에 변경 가능한 메세지 입니다._페페")
}
