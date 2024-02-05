//
//  ImagePicker.swift
//  MyBias
//
//  Created by 유지인 on 2/1/24.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isVisible:Bool
    @Binding var image:Image?
    @Binding var userInfo: UserInfo
    
    //var sourceType:Int
    var sourceType: UIImagePickerController.SourceType
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isVisible: $isVisible, image: $image, userInfo: $userInfo)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
          let picker = UIImagePickerController()
          picker.allowsEditing = true
          picker.sourceType = sourceType
          picker.delegate = context.coordinator
          return picker
      }
    
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//         let vc = UIImagePickerController()
//        vc.allowsEditing = true
//        //카메라인지 사진첩인지
//        vc.sourceType = sourceType == 1 ? .photoLibrary :.camera
//        
//        vc.delegate = context.coordinator
//        
//        return vc
//    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    class Coordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        
        @Binding var isVisible:Bool
        @Binding var image: Image?
        @Binding var userInfo: UserInfo
        
        init(isVisible: Binding<Bool>, image: Binding<Image?>, userInfo:Binding<UserInfo>) {
            _isVisible = isVisible
            _image = image
            _userInfo = userInfo
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                 if let uiImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                     let image = Image(uiImage: uiImage)
                     userInfo.image = image
                 } else if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                     let image = Image(uiImage: uiImage)
                     userInfo.image = image
                 }
                 isVisible = false
             }
        
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//               let image  = Image(uiImage: uiImage)
//                userInfo.image = image
//            }
//            isVisible = false
//        }
        
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//            image = Image(uiImage: uiImage)
//            userInfo.image = image
//            isVisible = false
//        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isVisible = false
        }
    }
}

