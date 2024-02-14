//
//  MyProfileView.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import SwiftUI

struct MyAccountView: View {
  @StateObject var viewModel = MyContentViewModel()
  @StateObject var accountViewModel = AccountViewModel()
  @StateObject var favourite = Favourite() // Favourite 인스턴스 생성
    
    var body: some View {
        
        VStack(spacing:0){
            NavigationStack{

                MyAccountTitleCell()
                    .padding(.bottom,10)
                        
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
            .onAppear{ accountViewModel.userInfo}
            .onAppear{ accountViewModel.retrieveUser()}
            
        }//VStack
    }
}

#Preview {
    MyAccountView()
}
