//
//  AccountView.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//
//import SwiftUI
//
//struct AccountView: View {
//    @StateObject var viewModel = AccountViewModel()
//
//    
//    var body: some View {
//        NavigationStack{
//          Form {
//              Section(header: Text("Personal Info"))    {
//                  TextField("이름",text: $viewModel.userInfo.name)
//                  TextField("이메일",text: $viewModel.userInfo.email)
//                      .keyboardType(.emailAddress)
//                      .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
//                      .disableAutocorrection(true)
//                  
//                  DatePicker("생일", selection: $viewModel.userInfo.birthday, displayedComponents: .date)
//                  
//                  Button{
//                      //변경사항을 저장 할때 오류가 있다면 알림창을 부르틑 트리거임
//                      viewModel.saveChanges()
//                  } label: {
//                      Text("변경사항 저장")
//                  }
//              }
//                Section(header: Text("요청")) {
//                    Toggle("추가 냅킨", isOn: $viewModel.userInfo.extraNapkins)
//                    Toggle("프리퀸", isOn: $viewModel.userInfo.frequen)
//                       
//                } .toggleStyle(SwitchToggleStyle(tint: .mainColor))
//
//            }
//            
//        }.navigationTitle("Account")
//            .onAppear{
//                //언제 retrieveUser를 부르는지
//                viewModel.retrieveUser()
//            }
//        //이메일 또는 이름 형식이 틀리면 알림창 뜨기
//        .alert(item:$viewModel.alertItem) {alertItem in
//                Alert(title: alertItem.title,
//                      message: alertItem.message,
//                      dismissButton: alertItem.dismissButton)
//        }
//    }
//}
//
//#Preview {
//    AccountView()
//}
//
