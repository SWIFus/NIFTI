//
//  ExtensionUtil.swift
//  Nifti
//
//  Created by BoMin on 2022/08/12.
//

import Foundation
import UIKit
import QRCode



// MARK: [색상 hex 값으로 지정]
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}



// MARK: [QR 이미지 뷰 설정]
extension UIImageView {
    convenience init(qrCode: QRCode) {
        self.init(image: qrCode.unsafeImage)
    }
}
