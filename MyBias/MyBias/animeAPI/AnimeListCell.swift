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

        VStack {
            AsyncImage(url:URL(string: anime.img)) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width:250, height: 300)
                
                     }placeholder: {
                        ProgressView()
                    }
            }
        }
    }


//#Preview {
//    AnimeListCell(anime: AnimeData.samepleAnime)
//}
