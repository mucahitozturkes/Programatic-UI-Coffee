//
//  EntryVC.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 1.03.2024.
//

import UIKit

class EntryVC: UIViewController {

    var imageBackground = GFImageView(frame: .zero)
    var titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 34, textColor: .white)
    var secondryTitle   = GFSecondaryTitleLabel(fontSize: 14)
    var EntryButton     = GFLabelButton(backgroundColor: UIColor.systemOrange, title: "Get Started", cornerR: 16)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureTitleLabel()
        configureSecondryTitle()
        configureButton()
        view.backgroundColor = .black
        
    }
    
    
    @objc func buttonPressed() {
        print("Go to GFTabBarController")
        let mainTabBarController                    = GFTabBarController()
        mainTabBarController.selectedIndex          = 0
        mainTabBarController.modalPresentationStyle = .overFullScreen

        self.present(mainTabBarController, animated: true, completion: nil)
    }





    func configureBackgroundView() {
        view.addSubview(imageBackground)
        imageBackground.frame = view.bounds
        imageBackground.image = UIImage(named: "Entry")
        
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageBackground.heightAnchor.constraint(equalToConstant: 650)
        ])
    }
    
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.text = "Coffee so good,\nyour taste buds\n will love it."
        titleLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -175),
            titleLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureSecondryTitle() {
        view.addSubview(secondryTitle)
        
        secondryTitle.text          = "The best grain, the finest roast, the\n powerful flavor."
        secondryTitle.numberOfLines = 2
        secondryTitle.textColor     = UIColor.darkGray
        secondryTitle.textAlignment = .center
        
        NSLayoutConstraint.activate([
            secondryTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondryTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondryTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            secondryTitle.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureButton() {
        view.addSubview(EntryButton)
        
        EntryButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            EntryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            EntryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            EntryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            EntryButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
