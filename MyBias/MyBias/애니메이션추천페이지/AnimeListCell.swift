//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by 유지인 on 1/17/24.
//

import SwiftUI

struct AnimeListCell: View {
    let anime: Anime
    let animeTag: Anime
    
    var body: some View {

       
            AsyncImage(url:URL(string: anime.img)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width:200, height: 200)
                     
                
                     }placeholder: {
                     //ProgressView()
                         Image("기본이미지")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:200, height: 200)
                }
            }
        }
    


//#Preview {
//    AnimeListCell(anime: AnimeData.samepleAnime)
//}
