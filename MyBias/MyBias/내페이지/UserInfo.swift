//
//  User.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//

import UIKit
import SwiftUI

/*Codable -> 쌍방향 언어 변환: 커스텀 유저정보(UserInfo)를 유저디폴트(UserDefaults)에 저장할 때 데이터(data)로 변환해야함 그다음에
 유저디폴트(UserDefaults)는 내 커스텀 유저정보(UserInfo)를 모름 ->그래서 커스텀 유저정보(UserInfo)를
 데이터로 변환한 후 저장,
 저장 후 그 데이터를 (UserDefaults)에서  retrieving(retrieve) 다시 가져 올떄 저장된 데이터를 user object 전환해야함
 
 Decodable -> one way : 데이터(Json)를 우리가 필요한 언어 (swift)로 변환
 
*/
//struct UserInfo: Codable {
//    var name : String
//    var email : String
//    var image : Image?
//    var birthday = Date()
//    var description : String
//   }


struct UserInfo: Codable {
    var name: String
    var email: String
    var imageData: Data?
    var birthday: Date
    var description: String
    
    var image: Image? {
           get {
               guard let data = imageData else {
                   return nil
               }
               guard let uiImage = UIImage(data: data) else {
                   return nil
               }
               return Image(uiImage: uiImage)
           }
           set {
               guard let newImage = newValue else {
                   imageData = nil
                   return
               }
               guard let cgImage = newImageToCGImage(newImage) else {
                   return
               }
               let uiImage = UIImage(cgImage: cgImage)
               self.imageData = uiImage.jpegData(compressionQuality: 1.0)
           }
       }
       
       private func newImageToCGImage(_ image: Image) -> CGImage? {
           guard let uiImage = imageToUIImage(image) else {
               return nil
           }
           return uiImage.cgImage
       }
       
       private func imageToUIImage(_ image: Image) -> UIImage? {
           let controller = UIHostingController(rootView: image)
           controller.view.sizeToFit()
           let imageRenderer = UIGraphicsImageRenderer(size: controller.view.bounds.size)
           let image = imageRenderer.image { _ in
               controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
           }
           return image
       }
    
    private enum CodingKeys: String, CodingKey {
        case name, email, imageData, birthday, description
    }
    
    init(name: String, email: String, image: UIImage?, birthday: Date, description: String) {
        self.name = name
        self.email = email
        self.imageData = image?.jpegData(compressionQuality: 1.0)
        self.birthday = birthday
        self.description = description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        imageData = try container.decodeIfPresent(Data.self, forKey: .imageData)
        birthday = try container.decode(Date.self, forKey: .birthday)
        description = try container.decode(String.self, forKey: .description)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(imageData, forKey: .imageData)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(description, forKey: .description)
    }
}
