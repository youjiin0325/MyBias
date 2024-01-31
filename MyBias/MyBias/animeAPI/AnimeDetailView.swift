//
//  AnimeDetailView.swift
//  MyBias
//
//  Created by 유지인 on 1/29/24.
//

import SwiftUI

struct AnimeDetailView: View {
        
    var uniqueTags: [String] {
        let allTags = animeManager.animes.flatMap { $0.tag.map {$0.name } }
            let set = Set(allTags)
            return Array(set)
        }

    var uniqueAuthors: [String] {
        let allTags = animeManager.animes.flatMap { $0.author.map {$0.name } }
            let set = Set(allTags)
            return Array(set)
        }
    
        let anime :Anime
        @StateObject var animeManager = AnimeStore(animes: data)
    
    
        var body: some View {
            VStack{
                
                ScrollView{
                    
                    AnimeListCell(anime: anime, animeTag: anime)
                    
                    Text(anime.name)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                    
                    let matchingAuthors = uniqueAuthors.filter { author in
                        anime.author.contains(where: {String(describing: $0.name) == author}) }
                    
                    if !matchingAuthors.isEmpty{
                        Text("작가: \(matchingAuthors.joined(separator: ", "))")
                            .frame(width: 240)
                        }
                    
                    Text("방영시기: \(anime.animation_info.air_year_quarter)")
                    Text("평점: \(anime.avg_rating, specifier: "%.1f")")
                    
                    let matchingTags = uniqueTags.filter { tag in
                        anime.tag.contains(where: { String(describing: $0.name) == tag }) }
                    
                    Text(matchingTags.joined(separator: ", "))
                        .frame(width: 300)
                }
            }
        }
    }

//#Preview {
//    AnimeDetailView(anime: Anime(id: 0001, name: "은혼", img: "https://image.laftel.net/items/thumbs/big/13ab0a22-8b65-4b50-ad2a-502a308d3de5.jpg", author: [Author(name: "하야오")], tag: [TagInfo(id: 0111, name: "동양풍")], animation_info: AnimationInfo(created: "2015"), avg_rating: 2.5))
//}
