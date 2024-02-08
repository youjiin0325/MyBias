//
//  User.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//

import UIKit
import SwiftUI

/*Codable: 쌍방향 언어 변환 =>커스텀 유저정보(UserInfo)를 유저디폴트(UserDefaults)에 저장할 때 데이터(data)로 변환해야함 그다음에 유저디폴트(UserDefaults)는 내 커스텀 유저정보(UserInfo)를 모름 ->그래서 커스텀 유저정보(UserInfo)를
 데이터로 변환한 후 저장,
 저장 후 그 데이터를 (UserDefaults)에서  retrieving(retrieve) 다시 가져 올떄 저장된 데이터를 user object 전환해야함
 
 Decodable: one way  => 데이터(Json)를 우리가 필요한 언어 (swift)로 변환
 Encodable: `Data`형으로 변형할 수 있는 타입 (JSON형)

*/

struct UserInfo: Codable {
    var name: String
    var email: String
    var imageData: Data?
    var birthday: Date
    var description: String
    /*
     image라는 계산된 속성(computed property)이 정의되어 있습니다. 이 계산된 속성은 imageData 속성을 기반으로 사용자의 이미지를 가져오고 설정하는 데 사용됩니다.
     */
    
    //MARK: - ImageData -> UIImage -> Image 변환하기
    var image: Image? {
              // get 블록에서는 imageData가 있는지 확인
           get {
               guard let data = imageData else {
                   //imageData가 없다면 nil을 반환
                   return nil
               }
               // UIImage로 변환하여 Image 형식으로 반환
               guard let uiImage = UIImage(data: data) else {
                   return nil
               }
               return Image(uiImage: uiImage)
           }
           set {
               // 블록에서는 새로운 이미지(newValue)가 있는지 확인
               guard let newImage = newValue else {
                   imageData = nil
                   return
               }
               //새로운 이미지를 CGImage로 변환
               /*
                CGImage는 Core Graphics 프레임워크에서 사용되는 형식으로, 비트맵 이미지 데이터를 나타냅니다. CGImage는 저수준의 그래픽 작업을 수행할 때 유용하며, 예를 들어 이미지 처리, 그림 그리기, 이미지 합성 등의 작업에 사용
                */
               guard let cgImage = newImageToCGImage(newImage) else {
                   return
               }
               //그 후 UIImage로 초기화하고, jpegData(compressionQuality: 1.0)를 사용하여 이미지 데이터를 imageData에 저장
               let uiImage = UIImage(cgImage: cgImage)
               self.imageData = uiImage.jpegData(compressionQuality: 1.0)
           }
       }
       
    
    //MARK: - CGImage와 UIImage로 변환 함수
       private func newImageToCGImage(_ image: Image) -> CGImage? {
           //1. imageToUIImage 함수를 호출, Image를 UIImage로 변환
           guard let uiImage = imageToUIImage(image) else {
               return nil
           }
           //2. 존재한다면, uiImage.cgImage를 반환하여 CGImage로 변환된 이미지 반환
           return uiImage.cgImage
       }
       
    //MARK: - imageToUIImage 함수는 Image 형식의 이미지를 매개변수로 받아와서 다음과 같은 작업을 수행
       private func imageToUIImage(_ image: Image) -> UIImage? {
           //1.image를 rootView로 하는 호스팅 컨트롤러를 생성
           let controller = UIHostingController(rootView: image)
           //2. 사이즈 조정
           controller.view.sizeToFit()
           //3. image를 rootView로 하는 호스팅 컨트롤러를 생성
           //4.이미지 렌더링 클로저 내에서 controller.view.bounds에 있는 뷰를 화면에 업데이트한 후에 그려줍
           let imageRenderer = UIGraphicsImageRenderer(size: controller.view.bounds.size)
           let image = imageRenderer.image { _ in
               controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
           }
           //5.그려진 이미지를 반환
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
