//
//  DetailCommentView.swift
//  MyBias
//
//  Created by 유지인 on 1/29/24.
//

import SwiftUI

struct DetailCommentView: View {
    @Binding var isShowingCommentView :Bool
    var user:User
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                
                Button{
                    isShowingCommentView = false
                }label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44,height: 44)
                 }
            }
            Text(user.name)
            Text(user.comment)
        }
        .padding()
    }
}

#Preview {
    DetailCommentView(isShowingCommentView: .constant(false), user: MockData.samepleData)
}
