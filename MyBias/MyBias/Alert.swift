//
//  ValidationAlert.swift
//  MyBias
//
//  Created by 유지인 on 2/2/24.
//

import SwiftUI

struct AlertItem :Identifiable{
    let id = UUID()
    let title:Text
    let message:Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    //MARK: - Account Alerts
    static let invaildForm = AlertItem(title: Text("Invaild Form"),message: Text("Please ensure all fields in the form have been filled out."),dismissButton: .default(Text("Ok")))
    
    static let invaildEmail = AlertItem(title: Text("Invaild Email"),message: Text("Please ensure  your eamil is correct."),dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),message: Text("Your profile information was successfully saved."),dismissButton: .default(Text("Ok")))
    
    static let invaildUserData = AlertItem(title: Text("Profile Error"),message: Text("There was  an error saving or retrieving your profile."),dismissButton: .default(Text("Ok")))
   
}
