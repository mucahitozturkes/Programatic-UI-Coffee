//
//  GFButton.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 1.03.2024.
//

import UIKit

class GFLabelButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String, cornerR: CGFloat) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerR
    }
    
    private func configure() {
        titleLabel?.font           = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class ScaledAspectFitButton: GFLabelButton {
    private let imageScale: CGFloat = 0.8

    override func layoutSubviews() {
           super.layoutSubviews()

           if let imageView = imageView {
               var newFrame = imageView.frame
               newFrame.size.width *= imageScale
               newFrame.size.height *= imageScale
               imageView.frame = newFrame

               imageView.frame.origin.x = 13
               imageView.frame.origin.y = (bounds.height - newFrame.height) / 2.0
           }
       }
    }

