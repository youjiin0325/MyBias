//
//  MyProfileView.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import SwiftUI

struct MyAccountView: View {
  @StateObject var viewModel = MyContentViewModel()
  @StateObject var favourite = Favourite() // Favourite 인스턴스 생성
    
    var body: some View {
        VStack{
            NavigationStack{
                Spacer()
                Text("#Studio_Anna_zzang")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .offset(x:-80)
                
                Spacer()
                    .frame(height: 30)

                MyAccountTitleCell()
                    .padding()
                
                ScrollView{
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(ExampleData.myContents) { content in
                            NavigationLink(destination: MyContentDetilView(content: content)) {
                                ContentImageView(content: content)
                            }.padding(-2)
                        }
                    }
                }
                    .navigationDestination(for: MyContent.self) { content in
                    MyContentDetilView(content: content)
                }
                
            }//NavigationStack
            
        }//VStack
    }
}

#Preview {
    MyAccountView()
}
