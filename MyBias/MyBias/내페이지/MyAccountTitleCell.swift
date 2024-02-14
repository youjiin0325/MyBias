//
//  MyAccountTitleCell.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

//import SwiftUI
//
//struct MyAccountTitleCell: View {
//    @State private var isEditingProfile = false
//    @StateObject var viewModel = AccountViewModel()
//  //  @EnvironmentObject var favourite:Favourite
//
//    var body: some View {
//        NavigationStack {
//            VStack(spacing:0){
//                HStack{
//                    Text("#\(viewModel.userInfo.name)")
//                        .fontWeight(.bold)
//                    
//                    Spacer()
//                    VStack{
//                        Text("9")
//                            .fontWeight(.bold)
//                        Text("게시물")
//                    }
//                    Spacer().frame(width: 25)
//                    
//                    VStack{
//                        Text("9")
//                            .fontWeight(.bold)
//                        Text("게시물")
//                    }
//                }//HStack
//                .padding(.horizontal,10)
//               
//                
//                //viewModel.userInfo.image 받아올 때 .ignoresSafeArea(.all)가 적용안되는 현상
//                
//                ZStack{
//                    if let image = viewModel.userInfo.image {
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 400, height: 250)
//                            .clipped() // 여백을 제거하기 위해 clipped() 메서드를 사용합니다.
//                            .ignoresSafeArea(.all)
//                    } else {
//                        Image("프로필사진")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 400, height: 300)
//                            .clipped() // 여백을 제거하기 위해 clipped() 메서드를 사용합니다.
//                            .ignoresSafeArea(.all)
//                    }
//                    VStack {
//                        Rectangle()
//                                .frame(width: 380,height: 60)
//                                .cornerRadius(5)
//                                .opacity(0.5)
//                                .overlay{
//                                    
//                                    Text(viewModel.userInfo.description.isEmpty ? "한 번 일어난 일은 절대 잊어버리지 않는단다. 그저 잊어버릴 뿐이지..." : viewModel.userInfo.description)
//                                        .font(.system(size: 12))
//                                        .foregroundStyle(Color.white)
//                                     
//                            }
//                    }//VStack
//                    .offset(y:-85)
//                    
//                    Rectangle()
//                        .frame(width: 380,height: 40)
//                        .cornerRadius(5)
//                        .opacity(0.5)
//                        .overlay{
//                            HStack{
//                                
//                                NavigationLink(destination: ProfileEditingView(), isActive: $isEditingProfile) {
//                                    Button {
//                                        print("프로필편집 버튼")
//                                        isEditingProfile = true
//                                    } label: {
//                                        VStack(spacing: 5) {
//                                            Text("프로필 편집")
//                                                .font(.system(size: 13))
//                                                .foregroundStyle(.white)
//                                            
//                                            Rectangle()
//                                                .frame(width: 100, height: 4)
//                                                .foregroundStyle(Color.mainColor)
//                                        }
//                                    }
//                                }//NavigationLink
//                                
//                               
//                                NavigationLink(destination:FavouriteThingView()) {
//                                    VStack(spacing:5){
//                                        Text("내취향")
//                                            .font(.system(size: 13))
//                                            .foregroundStyle(.white)
//                                        Rectangle()
//                                            .frame(width: 100,height: 4)
//                                            .foregroundStyle(Color.mainColor)
//                                        
//                                    }
//                                }//NavigationLink
//                                
//                            Spacer()
//                                
//                                Button {
//                                    print("plus")
//                                } label: {
//                                    VStack(spacing:5){
//                                        Text("New+")
//                                            .font(.system(size: 13))
//                                            .foregroundStyle(.white)
//                                        Rectangle()
//                                            .frame(width: 80,height: 4)
//                                            .foregroundStyle(Color.mainColor)
//                                    }
//                                }
//                            
//
//                            }//HStack
//                            .padding(.horizontal,15)
//                        }
//                        .offset(y:100)
//                    
//                }//ZStack
//                .padding(.bottom,-50)
//       
//            }//Vstack
//            .onAppear{viewModel.userInfo}
//            .onAppear{viewModel.retrieveUser()}
//        }//NavigationStack
//        
//    }
//}
//
//#Preview {
//    MyAccountTitleCell()
//}


import SwiftUI

struct MyAccountTitleCell: View {
    @State private var isEditingProfile = false
    @StateObject var viewModel = AccountViewModel()
    //@EnvironmentObject var favourite:Favourite
    
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
                    
                    NavigationLink(destination:FavouriteThingView()) {
                        Button {
                        } label: {
                            Text("내취향 보기")
 
                        }.buttonStyle(.bordered)
                    }.tint(Color.mainColor)

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
