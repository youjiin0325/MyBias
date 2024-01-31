//
//  SwiftUIView.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//

import SwiftUI

struct CommunityJPop: View {
    @StateObject var viewModel =  CommentViewModel()
    
    var body: some View {
        
        NavigationStack{
            
            VStack(alignment:.leading){
                Spacer()
                Spacer()
                HStack{
               
                    Button{
                        //새로운 글 추가하기
                    } label: {
                        Text("내가 쓴 글 찾기")
                            .font(.system(size: 12))
                            .foregroundStyle(Color.white)
                            .frame(width: 90, height: 40)
                            .background(Color.mainColor)
                            .cornerRadius(5)
                            .padding(.leading,20)}
 
                    Button{
                        //새로운 글 추가하기
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.mainColor)
                            .frame(width: 65, height: 40)
                            .background(Color.sub2Color)
                            .cornerRadius(5) }
 
                }.padding(.bottom,-40)//버튼이랑 리스트 사이 패딩
                
                List(1..<4){_ in
                        NavigationLink(destination: CommunityJPopDetailVIew()) {
                           
                                HStack{
                                    VStack(alignment:.leading){
                                        Text("제이팝 시티팝 여름에 듣기 딱 좋은 곡!")
                                            .font(.system(size: 18))
                                            .fontWeight(.semibold)
                                            .padding(.bottom,20)
                                        
                                        Text("Studio_Anna_zzang")
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                    }
                                    .padding(.trailing,20)
                                    
                                    Image("예시이미지")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 93,height: 93)
                                        .cornerRadius(2)
                                    
                                }
                        }//Navigation
                        .frame(width: 350)
                }//list
                Spacer()
            }.navigationTitle("J-pop")
  
        }.scrollContentBackground(.hidden)//background 제거
            
    }
}

#Preview {
    CommunityJPop()
}
