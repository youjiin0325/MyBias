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
            ZStack{
                VStack{
                    List{
                        ForEach(favourite.items){item in
                    
                            
                            NavigationLink(destination: AnimeDetailView(anime: item)) {
                                    HStack(spacing:0){
                                    AnimeListCell(anime: item, animeTag: item)
                                            .cornerRadius(5)
                                            .offset(x:-20)
                                    Spacer()
                                    Text(item.name)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .offset(x:-25)
                                    }
                                    .padding(.bottom)
                            }
                        }
                        .onDelete(perform:favourite.deleteFavourite)
                        .listRowSeparator(.hidden)// 리스트 라인 제거
                        
                    } .scrollContentBackground(.hidden)//background 제거
                    
                    if favourite.totalCount != 0 {
                        Text("내가 덕질하는 작품은 \(favourite.totalCount)개 입니다.")
                            .foregroundStyle(Color.mainColor)
                            .fontWeight(.semibold)
                            .padding()
                    }
                    
                }.frame(width: 400)
                .navigationTitle("덕질 리스트")
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
