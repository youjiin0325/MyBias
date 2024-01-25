//
//  SwiftUIView.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//

import SwiftUI

struct CommunityJPop: View {
    var body: some View {
        NavigationStack{
            VStack{
                List(1..<4){_ in
                    HStack{
                        VStack(alignment:.leading){
                            Text("제이팝 시티팝 여름에 듣기 딱 좋은 곡!")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Studio_Anna_zzang")
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                            Spacer()
                                .frame(height: 5)
                        }//VStack
                        Image("예시이미지")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 93,height: 93)
                            .cornerRadius(2)
                        
                    }//HStack
                    .padding(.top,10)
                }
            }.navigationTitle("J-pop")
            
        }.scrollContentBackground(.hidden)//background 제거
            
    }
}

#Preview {
    CommunityJPop()
}
