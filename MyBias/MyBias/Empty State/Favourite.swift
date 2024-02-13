//
//  Favourite.swift
//  MyBias
//
//  Created by 유지인 on 2/7/24.
//

import SwiftUI

final class Favourite: ObservableObject {
    @Published var items: [Anime] = []
    
    var totalCount: Int {
            items.count
        }
    
    
    func addFavourite(_ anime: Anime) {
        items.append(anime)
        
    }
    
    func deleteFavourite(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
      
    }
    
}
