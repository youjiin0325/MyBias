//
//  WhosFavourite.swift
//  MyBias
//
//  Created by 유지인 on 2/14/24.
//

import SwiftUI

struct WhosFavourite: View {
    @StateObject var animeManager = AnimeStore(animes: data)
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 350,height: 120)
                .foregroundStyle(Color.mainColor)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .overlay{
                    HStack{
                        Image("지브리캐릭터2")
                            .resizable()
                            .frame(width: 105,height: 110)
                            .cornerRadius(3.0)
                        
                        Image("지브리캐릭터2")
                            .resizable()
                            .frame(width: 105,height: 110)
                            .cornerRadius(3.0)
                        
                        Image("지브리캐릭터2")
                            .resizable()
                            .frame(width: 105,height: 110)
                            .cornerRadius(3.0)
                      
                }
            }
        }
    }
}

#Preview {
    WhosFavourite()
}
