//
//  MyBiasTabView.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//


import SwiftUI

struct MyBiasTabView : View {
    @EnvironmentObject var favourite:Favourite
    var body: some View {
        TabView{
            ComunitiesList()
                .tabItem { Label("커뮤니티", systemImage: "person.2")}
                    
            AnimeListview()
                .tabItem { Label("추천/검색", systemImage: "magnifyingglass")}
               
            ComunitiesList()
                .tabItem { Label("메인", systemImage: "house")}
                
            MyAccountView()
                .tabItem { Label("내 페이지", systemImage:  "suit.heart")}
                .badge(favourite.items.count)//뱃지 필요할 때
          }
    }
}

#Preview {
    MyBiasTabView()
}
