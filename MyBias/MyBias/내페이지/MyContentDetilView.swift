//
//  MyContentDetilView.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import SwiftUI

struct MyContentDetilView: View {
   // @State private var isShowingSafariView = false
    var content:MyContent
    
    var body: some View {
      
            VStack{
                ScrollView {
                    
                    HStack {
                        Text("# 2024.2.4")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.mainColor)
                            Spacer()
                        
                    }.padding(.leading)
                 
                    Image(content.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360,height: 360)
                        .cornerRadius(10)
                        .padding(.bottom,15)
                        
                    
                    VStack(alignment:.leading){
                        Text(content.title)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                        Text(content.contents)
                            .font(.system(size: 15))
                            
                        
                    }
                    .frame(width: 350,alignment:.leading)
                    
                    
            }.padding(20)
        }
    }
}


#Preview {
    MyContentDetilView(content: ExampleData.sampleContent)
}

//Button {
//    print("i like this post!")
//} label: {
//    Image(systemName: "heart.fill")
//        .foregroundStyle(Color.mainColor)
//        .font(.system(size: 20))
//    .shadow(radius: 3) }
//       }
