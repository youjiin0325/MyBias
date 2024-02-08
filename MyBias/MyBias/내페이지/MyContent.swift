//
//  Content.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import Foundation

struct MyContent: Hashable ,Identifiable{
   var id: String
   var title:String
   var contents:String
    var imageName:String
  // var data:Date
}

struct ExampleData{
    static let sampleContent = MyContent(id: "0001",title: "새로나온 지브리영화 봤당", contents: "지브리 영화 난생처음 영화관에서 봤다 ㅠㅠㅠ 너무 좋더라..지브리 영화를 보면서 자랐는데 내가 영화관에서 보는 날이 오다니 ㅠㅠㅠ 포스터도 두장 받았다 ㅎㅎㅎㅎ 방에 꾸며야징~기분 좋아져서 지브리 일러 모으는 중!", imageName: "프로필사진")
    
    static let myContents = [
        MyContent(id: "0001", title: "새로나온 지브리영화 봤당", contents: "지브리 영화 난생처음 영화관에서 봤다 ㅠㅠㅠ 너무 좋더라..지브리 영화를 보면서 자랐는데 내가 영화관에서 보는 날이 오다니 ㅠㅠㅠ 포스터도 두장 받았다 ㅎㅎㅎㅎ 방에 꾸며야징~기분 좋아져서 지브리 일러 모으는 중!", imageName: "지브리캐릭터7"),
        MyContent(id: "0002", title: "오늘은 날씨가 좋네요", contents: "오늘은 맑은 날씨에요. 햇살이 화사하게 비추고 있어서 기분이 좋아지네요. 날씨가 좋다보니 나들이를 가기에도 좋은 날이에요.", imageName: "지브리캐릭터2"),
        MyContent(id: "0003", title: "새로운 카페를 발견했어요", contents: "오늘 새로운 카페를 발견했어요. 분위기도 좋고 커피도 맛있어서 자주 가게 될 것 같아요. 다음에 함께 가보실래요?", imageName: "지브리캐릭터3"),
        MyContent(id: "0004", title: "여행 계획을 세우고 있어요", contents: "다음 달에 여행을 가기로 했어요. 어디로 가야할지 고민 중이에요. 여행지 추천이 있으시면 알려주세요!", imageName: "지브리캐릭터4"),
        MyContent(id: "0005", title: "오늘은 운동을 열심히 했어요", contents: "오늘은 체력 단련을 위해 운동을 열심히 했어요. 조금 힘들었지만 몸이 건강해지는 느낌이 들어서 뿌듯해요.", imageName: "지브리캐릭터5"),
        MyContent(id: "0006", title: "새로운 책을 읽고 있어요", contents: "요즘 새로운 책을 읽고 있는데 정말 흥미로워요. 이번 주말에는 책을 마무리하고 다른 책도 읽어보려고 생각 중이에요.", imageName: "지브리캐릭터6"),
        MyContent(id: "0007", title: "오늘은 친구들과 만나기로 했어요", contents: "오랜만에 친구들과 만나기로 했어요. 함께 맛있는 음식을 먹고 이야기를 나누는 건 정말 힐링이에요.", imageName: "지브리캐릭터7"),
        MyContent(id: "0008", title: "새로운 노래를 발견했어요", contents: "요즘 새로운 노래를 발견했어요. 가사도 좋고 멜로디도 좋아서 자꾸 듣게 되네요. 음악은 마음을 편안하게 만들어주는 힘이 있죠.", imageName: "프로필사진"),
    ]

}
