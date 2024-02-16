//
//  MyAccountTitleCell.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//


import SwiftUI

struct MyAccountTitleCell: View {
    @State private var isEditingProfile = false
    @StateObject var viewModel = AccountViewModel()
   @EnvironmentObject var favourite:Favourite
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Text("#\(viewModel.userInfo.name)")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                       
                    Spacer()
                }
                .padding(.horizontal)
                Spacer().frame(height: 20)
                //MARK: - 프로필사진, 게시물표시,소개 HStack
                HStack{
                    Spacer().frame(width: 50)
                    if let image = viewModel.userInfo.image {
                          image
                            .resizable()
                            .clipped()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150,height: 150)
                    }else {
                    
                           Image("프로필사진")
                            .resizable()
                            .clipped()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150,height: 150)
                    }
                    
                    Spacer()
                        .frame(width: 40)
                    
                    VStack {
                        
                        HStack(spacing:20){
                            
                            VStack{
                                
//                                Text("\(favourite.items.count)")
//                                   .fontWeight(.bold)
                                Text("내취향")
                            }
                            .foregroundStyle(Color.mainColor)
                            .frame(width: 60)
                            

                            VStack{
                                Text("9")
                                    .fontWeight(.bold)
                                Text("게시물")
                                
                            }
                            .foregroundStyle(Color.mainColor)
                            .fontWeight(.light)

                        }//HStack
                        .frame(width: 170)
                        
                        Text("\(viewModel.userInfo.description)")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                            .frame(width: 180,height: 60)
                        
                    }
                    Spacer().frame(width: 30)
                }//HStack
                .frame(width: 360)
                .padding(.bottom,30)

              
                //MARK: - 버튼 HStack
                HStack(spacing:20){
                    NavigationLink(destination:ProfileEditingView(), isActive: $isEditingProfile) {
                        Button {
                            isEditingProfile = true
                        } label: {
                            Text("프로필 편집")
 
                        }.buttonStyle(.bordered)
                            
                    }.tint(Color.mainColor)
                    
//                    NavigationLink(destination:FavouriteThingView()) {
//                        Button {
//                            
//                        } label: {
//                            Text("내취향 보기")
// 
//                        }.buttonStyle(.bordered)
//                    }.tint(Color.mainColor)

                    NavigationLink(destination: FavouriteThingView()) {
                        Text("내 취향보기")
                            .foregroundColor(Color.mainColor)
                            .frame(width:100,height: 34)
                            .background(Color.gradi1)
                            .cornerRadius(6)
                    }
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        
                        Text("NEW+")
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.mainColor)
                
                }//HStack
                .padding(.horizontal,10)
                //.frame(width: 200)
            }
            .onAppear{ self.viewModel.userInfo}
            .onAppear{
            // retrieveUser적용되면 나타남
                viewModel.retrieveUser() }
        }//NavigationStack
    }
}

#Preview {
    MyAccountTitleCell()
}
