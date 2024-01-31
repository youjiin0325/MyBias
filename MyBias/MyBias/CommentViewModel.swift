//
//  CommentViewModel.swift
//  MyBias
//
//  Created by 유지인 on 1/29/24.
//

import SwiftUI

class CommentViewModel:ObservableObject{
    
    var userComment: User? {
        didSet{
            isShowingCommentView = true
        }
    }
    @Published var isShowingCommentView = false
    
}
