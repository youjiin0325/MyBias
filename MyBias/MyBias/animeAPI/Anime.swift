//
//  Anime.swift
//  LafetelAPI
//
//  Created by 유지인 on 1/22/24.
//
import Foundation

//struct Anime: Identifiable,Decodable {
//    var id = UUID()
//    var results: [Results]
//    
//}

struct Anime:Identifiable,Decodable {
    let id : Int
    let name: String
    let type: String
    let img:String

}


struct AnimeResponse:Decodable {
    let request:[Anime]
}
