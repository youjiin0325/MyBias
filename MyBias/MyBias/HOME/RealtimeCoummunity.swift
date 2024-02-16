//
//  RealtimeCoummunity.swift
//  MyBias
//
//  Created by 유지인 on 2/14/24.
//

import SwiftUI

struct RealtimeCoummunity: View {
    let categorie = ["J-Pop", "지브리 스튜디오", "만화책", "캐릭터 굿즈", "애니메이션"].shuffled()
 
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<3) { index in
                    Text("\(index + 1)위 \(categorie[index])")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .padding(10)
                }.listRowSeparator(.hidden)// 리스트 라인 제거
                    .background(Color.gradi1)
                    .cornerRadius(5)
                    .padding(-5)
                    .frame(width: 350,alignment: .leading)
            } .scrollContentBackground(.hidden)//background 제거
        }
    }
}

#Preview {
    RealtimeCoummunity()
}
