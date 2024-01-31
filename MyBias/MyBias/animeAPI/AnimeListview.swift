//
//  ContentView.swift
//  LafetelAPI
//
//  Created by 유지인 on 1/22/24.
//

import SwiftUI

struct AnimeListview: View {
    @StateObject var animeManager = AnimeStore(animes: data)
    
    //태그분류 faltmap -> 중첩된 배열을 제거하고 평평한 배열
    var uniqueTags: [String] {
        let allTags = animeManager.animes.flatMap { $0.tag.map { $0.name } }
        let set = Set(allTags)
        return Array(set)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
                    ForEach(uniqueTags, id: \.self) { tag in
                            Text(tag)
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment: .leading)
                     
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                            LazyHStack{
                                ForEach(animeManager.animes.filter { $0.tag.contains(where: { $0.name == tag }) }) { anime in
                                    NavigationLink(value:anime) {
                                        
                                    VStack{
                                      
                                            AnimeListCell(anime: anime, animeTag: anime)
                                            Text(anime.name)
                                                .font(.system(size: 15))
                                                .fontWeight(.medium)
                                                .foregroundStyle(Color.black)
                                        }//VStack
                                    }// NavigationLink
                                }
                            }//LazyHStack
                         
                                
                        }//2번 ScrollView
                    }
                }// 1번 ScrollView
                .navigationTitle("내 취향 찰떡 애니 추천 🎁")
                .navigationDestination(for: Anime.self) {anime in
                    AnimeDetailView(anime: anime)
                }
                
            }//제일 처음 Vstack
            .padding(10)
        }
    }
}

   #Preview {
        AnimeListview()
    }

    
//            ZStack {
//                NavigationStack {
//                   List {
//                       ForEach(storeManager.animes) { anime in
//                           ForEach(tagManager.animeTagInfo, id: \.self) { tag in
//                             
//                                   NavigationLink(destination: AnimeDetailView(anime: anime)) {
//                                       AnimeListCell(anime: anime, animeTag: tag)
//                                   
//                               }
//                           }
//                       }
//                   }.navigationTitle("내 취향 찰떡🍟")
//                        .navigationDestination(for: Anime.self) {anime in
//                        AnimeDetailView(anime: anime)
//                }
//             }
//          }
      // }
   


