//
//  User.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//

import Foundation
import SwiftUI

/*Codable -> 쌍방향 언어 변환: 커스텀 유저정보(UserInfo)를 유저디폴트(UserDefaults)에 저장할 때 데이터(data)로 변환해야함 그다음에
 유저디폴트(UserDefaults)는 내 커스텀 유저정보(UserInfo)를 모름 ->그래서 커스텀 유저정보(UserInfo)를
 데이터로 변환한 후 저장,
 저장 후 그 데이터를 (UserDefaults)에서  retrieving(retrieve) 다시 가져 올떄 저장된 데이터를 user object 전환해야함
 
 Decodable -> one way : 데이터(Json)를 우리가 필요한 언어 (swift)로 변환
 
*/
struct UserInfo: Codable {
    var name = ""
    var email = ""
   // var image: Binding<UIImage?>?
    var birthday = Date()
    var description = ""
    
//    enum CodingKeys: String, CodingKey {
//           case name
//           case email
//           case birthday
//           case description
//          
//       }
//    init(name: String, email: String, image: Binding<UIImage?>?, birthday: Date, description: String) {
//           self.name = name
//           self.email = email
//           self.image = image
//           self.birthday = birthday
//           self.description = description
//           
//       }
//       
//       init(from decoder: Decoder) throws {
//           let container = try decoder.container(keyedBy: CodingKeys.self)
//           name = try container.decode(String.self, forKey: .name)
//           email = try container.decode(String.self, forKey: .email)
//           birthday = try container.decode(Date.self, forKey: .birthday)
//           description = try container.decode(String.self, forKey: .description)
//         
//       }
//       
//       func encode(to encoder: Encoder) throws {
//           var container = encoder.container(keyedBy: CodingKeys.self)
//           try container.encode(name, forKey: .name)
//           try container.encode(email, forKey: .email)
//           try container.encode(birthday, forKey: .birthday)
//           try container.encode(description, forKey: .description)
//           
//       }
   }
