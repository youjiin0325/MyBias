//
//  MyBiasTabView.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//


import SwiftUI

struct MyBiasTabView : View {
    var body: some View {
        TabView{
            ComunitiesList()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("커뮤니티")
                    
                }
            AnimeListview()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("추천/검색")
                }
            ComunitiesList()
                .tabItem {
                    Image(systemName: "house")
                    Text("메인")
                }
            ProfileEditingView()
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("내 페이지")
                }
        //}.accentColor(Color.mainColor)
        
//        }.onAppear(){
//            UITabBar.appearance().backgroundColor = .mainColor
          }
        
    }
}

#Preview {
    MyBiasTabView()
}
