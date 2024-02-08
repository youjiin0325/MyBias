//
//  LikePutToGetherView.swift
//  MyBias
//
//  Created by 유지인 on 2/7/24.
//

import SwiftUI

struct FavouriteThingView: View {
    
    @EnvironmentObject var favourite:Favourite
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    List{
                        ForEach(favourite.items){item in
                            AnimeListCell(anime: item, animeTag: item)
                                .frame(width: 50,height: 50)
                        }
                        .onDelete(perform:favourite.deleteFavourite)
                        
                    }.listStyle(PlainListStyle())
                    
                    Text("내가 덕질하는 작품은 \(favourite.totalCount)개 입니다.")
                        .foregroundStyle(Color.mainColor)
                        .fontWeight(.semibold)
                        .padding()

                   
                }.navigationTitle("좋아요 리스트")
                if favourite.items.isEmpty {
                    EmptyState(imageName: "emptyImage", message:"덕질이 부족합니다! 더 많은 작품을 확인하고 내 취향 박스에 담아보세요!")
                }
            }.padding()
        }
    }
    //좋아요 선택한 아이템 지우기
    func deleteItem(at offsets:IndexSet){
        favourite.items.remove(atOffsets: offsets)
    }
}
#Preview {
    FavouriteThingView()
}
