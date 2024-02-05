//
//  AnimeManager.swift
//  LafetelAPI
//
//  Created by 유지인 on 1/22/24.
//

import Foundation

class AnimeStore: ObservableObject {
    @Published var animes: [Anime]
    
    init(animes: [Anime]) {
        self.animes = animes
    }
}

