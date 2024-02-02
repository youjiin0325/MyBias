//
//  Anime.swift
//  LafetelAPI
//
//  Created by 유지인 on 1/22/24.
//
import Foundation


struct Anime: Identifiable,Decodable,Hashable {
   
    let id: Int
    let name: String
    let img: String
    let author: [Author] //작가
    let tag: [TagInfo] //장르 꼭 필요
    let animation_info: AnimationInfo
    let avg_rating: Float
    

    static func == (lhs: Anime, rhs: Anime) -> Bool {
           return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.img == rhs.img &&
               lhs.author == rhs.author &&
               lhs.tag == rhs.tag &&
               lhs.animation_info == rhs.animation_info &&
               lhs.avg_rating == rhs.avg_rating
       }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
           hasher.combine(name)
           hasher.combine(img)
           hasher.combine(author)
           hasher.combine(tag)
           hasher.combine(animation_info)
           hasher.combine(avg_rating)
       }
}

struct TagInfo: Codable,Equatable,Hashable,Identifiable {
    let id:Int
    let name: String
}

struct Author: Codable,Equatable,Hashable,Identifiable{
    let id:Int
    let name: String //작가이름
   
}


struct AnimationInfo: Decodable,Equatable ,Hashable{
    let air_year_quarter: String //방영시기

}



struct AnimeData{
//    static let samepleAnime = Anime(id: 0001, name: "은혼 1기", type: "animation", img: "https://image.laftel.net/items/thumbs/big/13ab0a22-8b65-4b50-ad2a-502a308d3de5.jpg")
    
//    static let sameple = Anime(id: 0001, name: "은혼 1기", img: "https://image.laftel.net/items/thumbs/big/13ab0a22-8b65-4b50-ad2a-502a308d3de5.jpg", type: "animation", isAdult: true, author: [Author(name: "미야자키 하야오")], tag: [TagInfo(type: "동양풍")], animationInfo: AnimationInfo(originalWriter: [Author(name: "미야자키 하야오")], created: "2024", season: "4기", originalAirTime: "2023.12"), avgRating: 9.5, tagInfo: Anime.TagInfo)
}




