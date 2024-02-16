//
//  AddNewPostView.swift
//  MyBias
//
//  Created by 유지인 on 2/15/24.
//

import SwiftUI
import PhotosUI

struct AddNewPostView: View {
    @State private var text = ""
    @State private var images: [UIImage] = []
    @State private var photosPickerItems : [PhotosPickerItem] = []
    
    var body: some View {
        NavigationStack {
            ScrollView{
                    HStack{
                        Text("#2024.02.14")
                            .font(.system(size: 12))
                        
                        Spacer()
                    }//HStack
                    .padding(.horizontal,20)
                     
                  PhotoPickerForAddingPost()
                    .frame(width: 350,height: 350)
               
  
                    //TextField("당신의 이야기를 써 주세요!",text: $text, axis: .vertical) 멀티라인
                    TextField("내가 좋아하는 것에 대한 이야기를 함께 나눠요!",text: $text, axis: .vertical)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(width: 350,height: 100)
                    
            }//ScrollView
                .navigationTitle("새 게시물")
            Divider()
                .padding(.bottom,15)
            Button {
                //새로운 게시물 추가
            } label: {
                Text("새 게시물 추가하기")
                    .frame(width: 360,height: 50)
                    .background(Color.mainColor)
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                    .cornerRadius(5)
                      }
            
        }//NavigationStack
    }
}

#Preview {
    AddNewPostView()
}
