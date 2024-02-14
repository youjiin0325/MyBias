//
//  ContentMainView.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import SwiftUI

struct ContentImageView: View {
    let content:MyContent
    
    var body: some View {
        VStack{
            Image(content.imageName)
                .resizable()
                .frame(width: 130,height: 120)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(5)
                
        }
    }
}

#Preview {
    ContentImageView(content: ExampleData.sampleContent)
}
