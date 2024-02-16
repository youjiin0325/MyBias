//
//  HomeView.swift
//  MyBias
//
//  Created by 유지인 on 2/14/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
    
        NavigationStack{
            Spacer()
            Text("Oh! 나의 덕후님")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.trailing,210)
            
            Divider()
            ScrollView{//ScrollView 를 쓰면 밑의 이세계 리스트가 안보임
                        Spacer()
                       
                            VStack{
                                Text("나는 지금 덕질 중")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .padding(.trailing,220)

                            }//VStack
                            
                            VStack {
                                
                                HStack(alignment:.top){
                                    Image("프로필사진")
                                        .resizable()
                                        .frame(width: 135,height: 135)
                                        .cornerRadius(5)
                                    
                                    VStack{
                                        HStack {
                                            Image("지브리캐릭터7")
                                                .resizable()
                                                .frame(width: 100,height: 80)
                                            .cornerRadius(5)
                                            if let image = viewModel.userInfo.image {
                                                image
                                                    .resizable()
                                                    .clipped()
                                                    .clipShape(Circle())
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 80,height: 80)
                                                    .foregroundStyle(Color.mainColor)
                                                
                                            }else {
                                                Image("기본이미지")
                                                    .resizable()
                                                    .clipped()
                                                    .clipShape(Circle())
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 80,height: 80)
                                                    .foregroundStyle(Color.mainColor)
                                            }//이미지if else
                                        }//HStack
                                        .padding(.bottom,10)
                                        
                                        
                                        Text("#판타지  #이세계   #시대물")
                                            .font(.system(size: 12))
                                            .fontWeight(.light)
                                            .foregroundStyle(Color.mainColor)
                                        HStack {
                                            Text("#로맨스")
                                                .font(.system(size: 12))
                                                .fontWeight(.light)
                                                .foregroundStyle(Color.mainColor)
                                            
                                            Button {
                                                
                                            } label: {
                                                Text("+ 태그 수정")
                                                    .font(.system(size: 12))
                                                    .fontWeight(.semibold)
                                            }.buttonStyle(.bordered)
                                                .tint(Color.mainColor)
                                            
                                        }
                                    }.frame(width: 200)

                            }//HStack
                                
                            
                        }//VStack
                        
                        
                        //이 중에 네 취향 하나 있겠지
                        Spacer().frame(height: 50)
                        Text("이 중에 네 취향 하나는 있겠지🎁")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.trailing,120)
                        
                        WhosFavourite()
                        
                        //이세계 커뮤니티
                        Spacer().frame(height: 50)
                HStack {
                    Text("이 세계 커뮤니티")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.leading,-35)
                    
                    Text("최근 게시물 기준")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.mainColor)
                        .padding(.trailing,110)
                }
                        
                        RealtimeCoummunity()
                           .frame(height: 300) // 높이를 지정하여 표시되도록 함
                           .padding(.top, -40)
                        
            }
        }//NavigationStack
    }
}

#Preview {
    HomeView()
}
