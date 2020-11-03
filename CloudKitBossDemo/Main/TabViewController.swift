//
//  TabViewController.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import UIKit

class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let controller0 = NotesViewController()
        controller0.title = "My Notes"
        controller0.isShared = false
        
        let navController0 = UINavigationController(rootViewController: controller0)
        navController0.tabBarItem = UITabBarItem(title: "Notes", image: .checkmark, tag: 0)
        
        let controller1 = SharesViewController()
        controller1.title = "Shared Notes"
        let navController1 = UINavigationController(rootViewController: controller1)
        navController1.tabBarItem = UITabBarItem(title: "Shared", image: .checkmark, tag: 1)
        
        viewControllers = [
            navController0,
            navController1
        ]
    }
}

