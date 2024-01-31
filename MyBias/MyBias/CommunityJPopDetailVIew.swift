//
//  CommunityJPopDetailVIew.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//

import SwiftUI

struct CommunityJPopDetailVIew: View {
    @StateObject var viewModel =  CommentViewModel()
    
    @State var isWriter = false
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                
                HStack {
                    Text("#Studio_Anna_zzang")
                        .font(.system(size: 12))
                    .foregroundStyle(.secondary)
                   
                    //글쓴이가 쓴 글이면 수정 버튼이 보임
                    if !isWriter {
                        Button{
                            
                            //수정버튼
                        }label: {
                            Text("수정")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .frame(width: 65,height: 30)
                                .background(Color.gradi1)
                                .foregroundStyle(Color.black)
                                .cornerRadius(2)
                                .padding(.leading,160)
                            
                        }
                    }
                }//HStack
             
                   
                Spacer()
                    .frame(height: 50)
                
                Text("제이팝 시티팝 여름에 듣기 딱 좋은 곡!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
                Image("예시이미지")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350,height: 360)
                    .cornerRadius(10)
                
                Text("체인소맨 친구 추천으로 봤는데 완전 주술회전이랑 맞먹음 ,,,너무 재미있어서 만화책도 조금씩 보고 있음. 오프닝 곡도 미쳤음 이거 보고 기타 배우고 싶더라 다른 애니도 추천받음!!!")
                    .frame(width: 355)
                    .font(.system(size: 15))
                Spacer()
                    .frame(height: 150)
                
                HStack{
                    Button{
                      //댓글버튼
                    }label: {
                       Image(systemName: "message.fill")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.mainColor)
                    }
//                    .onTapGesture {
//                        viewModel.userComment = user
//                        print("tapped")
//                    }
   
                }
            }//Vstack
            .sheet(isPresented: $viewModel.isShowingCommentView) {
                DetailCommentView(isShowingCommentView: $viewModel.isShowingCommentView,
                                  user: viewModel.userComment ?? MockData.samepleData)
            }
          
        }//scrollView
    }
}

#Preview {
    CommunityJPopDetailVIew()
}
