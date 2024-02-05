//
//  MyPageView.swift
//  MyBias
//
//  Created by 유지인 on 2/1/24.
//

import SwiftUI

struct ProfileEditingView: View {
    @StateObject var viewModel = AccountViewModel()
    
    @State var showActionSheet:Bool = false
    @State var showImagePicker:Bool = false
    @State var sourceType: Int = 0
    
    
    var body: some View {
    
//            NavigationStack {
                ZStack {
                Spacer()
            
                Form {
                    
                    Text(!viewModel.userInfo.name.isEmpty ? "#\(viewModel.userInfo.name)" : "Hi")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Section{
 
                        VStack{
                            if let image = viewModel.userInfo.image {
                                image
                                    .resizable()
                                    .clipped()
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130,height: 130)
                                    .foregroundStyle(Color.mainColor)
                                    .overlay(
                                        CameraButtonView(showActionSheet: $showActionSheet)
                                            .offset(x:40,y: 65)
                                    )
                            }else {
                               Image("기본이미지")
                                    .resizable()
                                    .clipped()
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130,height: 130)
                                    .foregroundStyle(Color.mainColor)
                                    .overlay(
                                        CameraButtonView(showActionSheet: $showActionSheet)
                                            .offset(x:40,y: 65)
                                    )
                            }
                            
                        }
                        .padding(.bottom,50)
                        
                        TextField("이름",text: $viewModel.userInfo.name)
                        TextField("이메일",text: $viewModel.userInfo.email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .disableAutocorrection(true)
                      
                        DatePicker("생일", selection: $viewModel.userInfo.birthday, displayedComponents: .date)

                        TextField("당신의 이야기를 들려주세요",text: $viewModel.userInfo.description)
                                .lineLimit(1...10)
                                .lineSpacing(5)
                                .frame(width: 300)
     
                        Button{
                            //변경사항을 저장 할때 오류가 있다면 알림창을 부르틑 트리거임
                            viewModel.saveChanges()
                        } label: {
                            Text("변경사항 저장")
                                .foregroundStyle(Color.white)
                                .fontWeight(.bold)
                                .frame(width: 120,height: 50)
                                .background(Color.mainColor)
                                .cornerRadius(5)
                        }
                    }
                    
                }.listRowSeparator(.hidden)// 리스트 라인 제거
                .scrollContentBackground(.hidden)//background 제거
                .padding()
                .navigationTitle("프로필 설정")
                
                .actionSheet(isPresented: $showActionSheet, content: { ()-> ActionSheet in
                    ActionSheet(title: Text("이미지를 선택하세요"),
                                message: Text("카메라 또는 사진첩에서 이미지를 선택해주세요"),
                                buttons: [ActionSheet.Button.default(Text("카메라"),
                                action: {
                        self.sourceType = 0
                        self.showImagePicker.toggle()
                        
                          }),
                    ActionSheet.Button.default(Text("사진첩"),action: {
                        //이미지 사진첩 보임
                        self.sourceType = 1
                        self.showImagePicker.toggle()
                        }),
                    ActionSheet.Button.cancel()
                    ])
            
                })
                //isShow이 true가 되면 이미지 사진첩이 보여짐
               if showImagePicker {
                   ImagePicker(isVisible: $showImagePicker, image: $viewModel.userInfo.image, userInfo: $viewModel.userInfo ,sourceType: sourceType == 1 ? .photoLibrary : .camera)
                }
                
                //Image("지브리프사")-> 기본이미지
                }.onAppear{ self.viewModel.userInfo}
            
            .onAppear{
            // retrieveUser적용되면 나타남
            viewModel.retrieveUser() }
            
            //이메일 또는 이름 형식이 틀리면 알림창 뜨기
            .alert(item:$viewModel.alertItem) {alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
            }
        }
    }
//}

#Preview {
    ProfileEditingView()
}
