//
//  AnimeDetailView.swift
//  MyBias
//
//  Created by 유지인 on 1/29/24.
//

import SwiftUI

struct AnimeDetailView: View {
    
    let tagColumns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
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
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    let anime :Anime
    
    //@EnvironmentObject <=> Favourite이라는 구조체에 접근가능함
    @EnvironmentObject var favourite: Favourite
    
    @StateObject var animeManager = AnimeStore(animes: data)
    @State var isClicked = false
    
    var body: some View {
        VStack {
                ScrollView{
                    AsyncImage(url:URL(string: anime.img)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:350, height: 400)
                            .cornerRadius(10)
                        
                    }placeholder: { ProgressView()}
                    
                    Spacer()
                        .frame(height: 20)
                    
                    
                    VStack{
                    
                        Text(anime.name)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .frame(width: 300,alignment: .center)
                        .frame(width:300)
                        
                        Spacer().frame(height: 16)
                    
                        VStack(alignment:.leading ,spacing:5){
                            Text("제작정보")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .frame(width:350,alignment:.leading)
                                .padding(.bottom,10)
                            
                            
                                let matchingAuthors = uniqueAuthors.filter { author in
                                    anime.author.contains(where: {String(describing: $0.name) == author}) }
                                
                                if !matchingAuthors.isEmpty{
                                   
                                Text("작가")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                           
                                    
                                Text(" \(matchingAuthors.joined(separator: ", "))")
                                    .font(.system(size: 13))
                                    .fontWeight(.regular)
                                    .padding(.bottom,8)
                                }

                                Text("방영시기")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                  
                                Text("\(anime.animation_info.air_year_quarter)")
                                    .font(.system(size: 13))
                                    .fontWeight(.regular)
                                    .lineLimit(3)
                                    .padding(.bottom,8)
                                   
                            
                                Text("평점")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    
                                Text("\(anime.avg_rating, specifier: "%.1f")점")  
                                    .font(.system(size: 13))
                                    .fontWeight(.regular)
                            Spacer().frame(height: 15)
                            
                        
                            Text("태그")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .frame(width:350,alignment:.leading)
                                
                            
                            let matchingTags = uniqueTags.filter { tag in
                                anime.tag.contains(where: { String(describing: $0.name) == tag }) }
                            VStack{
                                Text("# \(matchingTags.joined(separator: ",# "))")
                                    .foregroundStyle(Color.mainColor)
                                    .font(.system(size: 13))
                                    .fontWeight(.semibold)
                                    .frame(width:340,alignment: .leading)
                            }
                            
                        }//VStack
                        .padding(.leading)
                        
                        Spacer()
                            .frame(height: 32)
        
                        //MARK: - 태그의 글자의 길이가 너무 길어 다른 태그의 영역을 침범하거나, 잘릴 때 어떻게 해결해야하지?
//                        LazyVGrid(columns: columns) {
//                            ForEach(matchingTags.indices, id: \.self) { index in
//                                Text("#\(matchingTags[index])")
//                                    .font(.system(size: 15))
//                                    .fontWeight(.semibold)
//                                    .foregroundStyle(Color.mainColor)
//                                    .padding(10)
//                                    .background(Color.gradi1)
//                                    .cornerRadius(10)
//                                    .frame(height:50)
//                                    .fixedSize() // 고정된 크기로 설정하여 다른 요소에 영향을 주지 않도록 합니다.
//                                    //.lineLimit(1) // 태그가 너무 길어질 경우 한 줄로 제한합니다.
//                            }//.padding(5)
//
//                        }
//                        .frame(maxWidth: 350, alignment: .leading)

                        Button {
                            print("i like this post!")
                            //addFavourite 함수를 이용하여 이 버튼을 클릭하면 좋아요한 작품들만 Favourite에 모여짐
                            isClicked = true
                            favourite.addFavourite(anime)
                        } label: {
                           // MainButton(title: "내취향")
                            Text("내 취향 담기")
                            Image(systemName: "suit.heart.fill")

                        } .foregroundStyle(Color.mainColor)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .frame(width:200,height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.mainColor, lineWidth: 1) )
                    }
                    Spacer()
                        .frame(height: 32)
                    
                }.navigationTitle("작품 정보")
            }
        }
    }
#Preview {
    AnimeDetailView(anime: Anime(id: 0001, name: "은혼", img: "https://image.laftel.net/items/thumbs/big/13ab0a22-8b65-4b50-ad2a-502a308d3de5.jpg", author: [Author(id: 0001, name: "하야오")], tag: [TagInfo(id: 0111, name: "동양풍")], animation_info: AnimationInfo(air_year_quarter: "2015"), avg_rating: 2.5))
}
