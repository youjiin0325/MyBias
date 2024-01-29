//
//  ContentView.swift
//  LafetelAPI
//
//  Created by 유지인 on 1/22/24.
//

import SwiftUI

struct AnimeListview: View {
    
    @StateObject var storeManager = AnimeStore(animes: data)
    
    var body: some View {
           VStack {
               List {
                   ForEach(storeManager.animes) { anime in
                       HStack{
                           
                           AsyncImage(url:URL(string: anime.img)) { image in
                               image.resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width:100, height: 100)
                           }placeholder: {
                               ProgressView()
                           }
                           
                           Text(anime.name)
                           
                       }
                    }
               }
           }
           .padding()
       }
   }

#Preview {
    AnimeListview()
}
