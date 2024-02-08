//
//  MyAccountTitleCell.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import SwiftUI

struct MyAccountTitleCell: View {
    @State private var isEditingProfile = false
    
    @EnvironmentObject var favourite:Favourite
    
    var body: some View {
        NavigationStack {
            VStack{
               
                //MARK: - 프로필사진, 게시물표시,소개 HStack
                HStack{

                    Image("프로필사진")
                         .resizable()
                         .clipped()
                         .clipShape(Circle())
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 120,height: 120)
                    
                    Spacer()
                        .frame(width: 50)
                    
                    VStack {
                        
                        HStack(spacing:20){
                            
                            VStack{
                                
                                Text("\(favourite.items.count)")
                                    .fontWeight(.bold)
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
                        .frame(width: 150)
                        
                        Text("한 번 일어난 일은 절대 잊어버리지 않는단다. 그저 잊어버릴 뿐이지...")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                            .frame(width: 180,height: 60)
                        
                    }
                    
                }//HStack
                .frame(width: 360)
                .padding(.bottom,20)

              
                //MARK: - 버튼 HStack
                HStack{
                    NavigationLink(destination:ProfileEditingView(), isActive: $isEditingProfile) {
                        Button {
                            print("프로필편집 버튼")
                            isEditingProfile = true
                        } label: {
                            Text("프로필 편집")
                                .frame(width: 140,height: 40)
                                .foregroundStyle(Color.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.mainColor, lineWidth: 1) )
                                
                        }
                    }
                    
                    NavigationLink(destination:FavouriteThingView()) {
                        Text("My Thing")
                            .frame(width: 140,height: 40)
                            .foregroundStyle(Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.mainColor, lineWidth: 1) )
                    }
                    
                    Button {
                        print("plus")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18 ))
                            .fontWeight(.bold)
                            .frame(width: 60,height: 40)
                            .background(Color.mainColor)
                            .cornerRadius(5)
                    }
                

                }//HStack
                //.frame(width: 200)

            }
        }//NavigationStack
    }
}

#Preview {
    MyAccountTitleCell()
}
