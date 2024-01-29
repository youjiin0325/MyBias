//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by 유지인 on 1/17/24.
//

import SwiftUI

struct AnimeListCell: View {
    let appetizer:Appetizer
    
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width:120,height: 90)
                .cornerRadius(8)
            VStack(alignment:.leading,spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                //specifier: "%.2f" -> 소수점 뒤의 0의 갯수 제한?
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
        }
    }
}

#Preview {
    AnimeListCell(appetizer: MockData.sampleAppetizer)
}
