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
        
        UITabBar.appearance().tintColor = .systemIndigo
        UITabBar.appearance().barTintColor = UIColor.white
        viewControllers = [homeTabbar(), settingsTabbar()]
    }

    
    func homeTabbar() -> UIViewController {
        let homeTB = HomeVC()
        homeTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemIndigo], for: .normal)
        homeTB.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemIndigo], for: .normal)
        return homeTB
    }

    
    func settingsTabbar() -> UIViewController {
        let settingsTB = SettingsVC()
        settingsTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemIndigo], for: .normal)
        settingsTB.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        settingsTB.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.systemIndigo], for: .normal)
        return settingsTB
    }
}

