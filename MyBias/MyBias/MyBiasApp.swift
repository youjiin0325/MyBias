//
//  MyBiasApp.swift
//  MyBias
//
//  Created by 유지인 on 1/25/24.
//

import SwiftUI

@main
struct MyBiasApp: App {
    
    var favourite = Favourite()
    
    var body: some Scene {
        WindowGroup {
            //MARK: - 가장 상위인 ContentView 에 .environmentObject(favourite) 환경설정을 넣어 모든 뷰에서 접근가능하게 만듬.
            ContentView().environmentObject(favourite)
        }
    }
}
