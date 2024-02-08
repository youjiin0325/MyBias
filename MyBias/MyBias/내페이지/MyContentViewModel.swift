//
//  MyContentStore.swift
//  MyBias
//
//  Created by 유지인 on 2/6/24.
//

import SwiftUI


class MyContentViewModel: ObservableObject {
    var selectedContent: MyContent? {
    
        didSet{ isShowingDetailContentView = true}
            
        }
    @Published var isShowingDetailContentView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}


