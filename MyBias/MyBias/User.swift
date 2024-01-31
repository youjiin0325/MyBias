//
//  User.swift
//  MyBias
//
//  Created by 유지인 on 1/29/24.
//

import Foundation

struct User:Hashable,Identifiable{
    let id =  UUID()//유니크한 아이디를 줌
    let name:String
    let comment:String
    
}

struct MockData{
    static let samepleData = User(name: "콩순이", comment: "완전 완전 내취향 저격입니다")
    
    static let comments = [
        User(name: "철수", comment: "난 프린세스 제일 좋아"),
        User(name: "맹구", comment: "멋진 돌 박사가 되고싶어!"),
        User(name: "짱구", comment: "지나가는 예쁜 누나들~~")
        
    ]
}
