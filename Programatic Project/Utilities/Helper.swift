//
//  Helper.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 10.03.2024.
//

import UIKit


//set button image size
extension UIImage {
    func resized(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}

//scale tabbar images
extension UIImage {
    func scaleImage(scale: CGFloat) -> UIImage {
        let newSize = CGSize(width: size.width * scale, height: size.height * scale)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let scaledImage = renderer.image { (context) in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
        return scaledImage
    }
}
