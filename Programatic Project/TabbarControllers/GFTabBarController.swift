//
//  GFTabBarController.swift
//  Programatic Project
//
//  Created by mücahit öztürk on 1.03.2024.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor(named: "buttoncolor") ?? .red
        UITabBar.appearance().barTintColor = UIColor.white
        viewControllers = [homeTabbar(), favoriteTabbar(), orderTabbar(), alertTabbar()]
    }

    func homeTabbar() -> UIViewController {
        let homeTB = HomeVC()
        homeTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "buttoncolor") ?? .red], for: .normal)
        
        if let originalImage = UIImage(named: "home") {
            let scaledImage = originalImage.withRenderingMode(.alwaysOriginal).resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch).scaleImage(scale: 0.5)
            
            homeTB.tabBarItem = UITabBarItem(title: "", image: scaledImage, tag: 0)
        }
        
        return homeTB
    }

    
    func favoriteTabbar() -> UIViewController {
        let favoriteTB = FavoriteVC()
        favoriteTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "buttoncolor") ?? .red], for: .normal)
        
        if let originalImage = UIImage(named: "favorite") {
            let scaledImage = originalImage.withRenderingMode(.alwaysOriginal).resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch).scaleImage(scale: 0.5)
            
            favoriteTB.tabBarItem = UITabBarItem(title: "", image: scaledImage, tag: 1)
        }
        
        return favoriteTB
    }

    func orderTabbar() -> UIViewController {
        let orderTB = OrderVC()
        orderTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "buttoncolor") ?? .red], for: .normal)
        
        if let originalImage = UIImage(named: "ordered") {
            let scaledImage = originalImage.withRenderingMode(.alwaysOriginal).resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch).scaleImage(scale: 0.5)
            
            orderTB.tabBarItem = UITabBarItem(title: "", image: scaledImage, tag: 2)
        }
        
        return orderTB
    }

    func alertTabbar() -> UIViewController {
        let alertTB = AlertVC()
        alertTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(named: "buttoncolor") ?? .red], for: .normal)
        
        if let originalImage = UIImage(named: "alert") {
            let scaledImage = originalImage.withRenderingMode(.alwaysOriginal).resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch).scaleImage(scale: 0.5)
            
            alertTB.tabBarItem = UITabBarItem(title: "", image: scaledImage, tag: 3)
        }
        
        return alertTB
    }
}



