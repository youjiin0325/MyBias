//
//  MainButton.swift
//  MyBias
//
//  Created by 유지인 on 2/8/24.
//

import SwiftUI

struct MainButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        HStack{
            Text(title)
            Image(systemName: "heart.fill")
        } 
        .font(.title3)
        .foregroundStyle(Color.mainColor)
        .frame(width:200,height: 50)
    }
}

#Preview {
    MainButton(title: "Test Title")
}
