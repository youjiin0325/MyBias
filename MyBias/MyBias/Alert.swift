//
//  ValidationAlert.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//

import SwiftUI

struct Alert :Identifiable{
    let id = UUID()
    let title:Text
    let message:Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    static let invaildName = Alert(title: Text("잘못된 이름"),message: Text("정확한 이름을 입력하세요"),dismissButton: .default(Text("Ok")))
   
}
