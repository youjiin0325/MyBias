//
//  ListTitleView.swift
//  MyBias
//
//  Created by 유지인 on 1/29/24.
//

import SwiftUI

struct ListTitleView: View {
    let name: String
    let comment:String
    
    var body: some View {
        VStack{
            Text(name)
            Text(comment)
        }
    }
}

//#Preview {
//    ListTitleView()
//}
