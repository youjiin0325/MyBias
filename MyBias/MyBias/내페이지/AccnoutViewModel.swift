//
//  AccnoutViewModel.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("userInfo") private var userData: Data?
    
    
    @Published var userInfo = UserInfo(name: "", email: "", image: nil, birthday: Date(), description: "")

    //에러 알림창
    @Published var alertItem : AlertItem?

  
    
    func saveChanges() {
        //1. 변경사항 저장할때 이메일 형식, 폼 형식 체크
        guard isValidForm else { return}
        
        //2.저장한 커스텀 유저를 encode를 데이터화 시키고 userdefaults에 저장
        do{//1. encode 유저데이터 (저장을 위해)
            let data =  try JSONEncoder().encode(userInfo)
            userData = data
            //3. 유저 데이터기 성공적으로 저장이 되면 알림
            alertItem = AlertContext.userSaveSuccess
            
        }catch{
            //3 - 1. 유저 데이터에 에러가 있거나 다시 가져올 수 없는 데이터라면 에러 알림
            alertItem = AlertContext.invaildUserData
        }
        
    }
    
    
    func retrieveUser() {
        //유저 데이터를 저장한 적이 한번도 없다면 Nil 그래서 데이터를 가져오기전에 체크!
        guard let userData = userData else { return}
        
        do{
            userInfo = try JSONDecoder().decode(UserInfo.self, from: userData)
            
        }catch{
            alertItem = AlertContext.invaildUserData
        }
    }
    
    
    //잘못된 이메일 형식등 에러를 알려주기 위함
    var isValidForm:Bool{
        guard !userInfo.name.isEmpty && !userInfo.email.isEmpty else {
            alertItem = AlertContext.invaildForm
            return false
        }
        
        //올바른 이메일 형식이 맞는지 확인하는 정규식
        guard userInfo.email.isValidEmail else {
            alertItem = AlertContext.invaildEmail
            return false
        }
        return true
    }
  
}
