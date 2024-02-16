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
            
            //ContentView()//.environmentObject(favourite)을 뺴고 쓰면 다른 fetal 에러 발생
           // SwiftUI/EnvironmentObject.swift:90: Fatal error: No ObservableObject of type Favourite found. A View.environmentObject(_:) for Favourite may be missing as an ancestor of this view.
            
            //MARK: -  ContentView().environmentObject(favourite)
            /*
             이 environmentObject를 사용하고 사용하는 뷰에서는 preview crash 에러가 발생
             
             */
        }
    }
}
