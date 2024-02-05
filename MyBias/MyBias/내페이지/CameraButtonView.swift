//
//  CameraButtonView.swift
//  MyBias
//
//  Created by 유지인 on 2/1/24.
//

import SwiftUI

struct CameraButtonView: View {
    @Binding var showActionSheet: Bool
    var body: some View {
        
        Button(action: {
            self.showActionSheet.toggle()
        }, label: {
            RoundedRectangle(cornerRadius: 30)
              .frame(width: 38,height: 38 ,alignment: .center)
              .foregroundStyle(.white)
              .overlay(
                  RoundedRectangle(cornerRadius: 30)
                      .frame(width:36,height: 36,alignment: .center)
                      .foregroundStyle(Color.init(red: 232/255, green: 233/255, blue: 231/255))
                      .overlay(
                      Image(systemName: "camera.fill")
                          .foregroundStyle(.black) )
          )
        })
         
    }
}

#Preview {
    CameraButtonView(showActionSheet: .constant(false)).previewLayout(.sizeThatFits)
        .padding()
}
