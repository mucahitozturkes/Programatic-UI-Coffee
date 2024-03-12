//
//  Helper.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 10.03.2024.
//

import UIKit

extension UIImage {
    
    func resized(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
}


