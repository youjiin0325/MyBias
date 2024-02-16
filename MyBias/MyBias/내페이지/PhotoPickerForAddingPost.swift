//
//  PhotoPickerForAddingPost.swift
//  MyBias
//
//  Created by 유지인 on 2/15/24.
//

import SwiftUI
import PhotosUI

struct PhotoPickerForAddingPost: View {
    
    @State private var images: [UIImage] = []
    @State private var photosPickerItems : [PhotosPickerItem] = []
    
    var body: some View {
        VStack {
            
            PhotosPicker("사진을 선택하세요", selection: $photosPickerItems, maxSelectionCount: 5, selectionBehavior:.ordered)
                .buttonStyle(.bordered)
                .tint(Color.mainColor)
            
            ScrollView(.horizontal){
                HStack(spacing:10){
                    ForEach(0..<images.count,id:\.self) {i in
                        Image(uiImage: images[i])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300,height: 300)
                            .cornerRadius(10)
                    }
                }.padding(.horizontal,15)
            }
        }
        .onChange(of: photosPickerItems) {_,_ in
            Task{
                for item in photosPickerItems {
                    if let data = try? await item.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            images.append(image)
                        }
                    }
                }
                
                photosPickerItems.removeAll()
            }
        }
    }
}
#Preview {
    PhotoPickerForAddingPost()
}
