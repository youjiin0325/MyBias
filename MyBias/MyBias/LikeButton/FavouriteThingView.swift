//
//  LikePutToGetherView.swift
//  MyBias
//
//  Created by 유지인 on 2/7/24.
//

import SwiftUI

struct FavouriteThingView: View {
    @State private var animeItems = AnimeData.animeItems
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    List{
                        ForEach(animeItems){item in
                            AnimeListCell(anime: item, animeTag: item)
                                .frame(width: 50,height: 50)
                        }
                        .onDelete(perform: deleteItem)
                        
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        print("좋아요한 작품")
                    } label: {
                        Text("좋아요버튼")
                            .foregroundStyle(Color.white)
                            .frame(width:200,height: 50)
                            .background(Color.mainColor)
                            .cornerRadius(10)
                    }
                    .padding()
                   
                }.navigationTitle("좋아요 리스트")
                if animeItems.isEmpty {
                    EmptyState(imageName: "emptyImage", message:"덕질이 부족합니다! 더 많은 작품을 확인하고 내 취향 박스에 담아보세요!")
                }
            }
        }
    }
    //좋아요 선택한 아이템 지우기
    func deleteItem(at offsets:IndexSet){
        animeItems.remove(atOffsets: offsets)
    }
}
#Preview {
    FavouriteThingView()
}
