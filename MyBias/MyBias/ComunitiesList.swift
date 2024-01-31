//
//  ComunitiesList.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//

import SwiftUI

struct ComunitiesList: View {
    let categorie = ["J-Pop","지브리 스튜디오","만화책","캐릭터 굿즈","애니메이션"]
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("이 세계 커뮤니티")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top,8)
                
                Divider()
                List{
                    ForEach(categorie.indices) { item in
                    
                        NavigationLink(destination: CommunityJPop()) {
                                Text(categorie[item])
                                .fontWeight(.semibold) }
                                .frame(width:320,height: 40)
                                .padding()
                                .background(Color.subColor)
                                .cornerRadius(5)

                    }.listRowSeparator(.hidden)// 리스트 라인 제거
                }.scrollContentBackground(.hidden)//background 제거
            }
        }
    }
}
#Preview {
    ComunitiesList()
}
