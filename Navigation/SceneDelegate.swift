//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let tabBarController = UITabBarController()
        
        let feedVC = FeedViewController()
        feedVC.view.backgroundColor = .magenta
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.append.fill"), tag: 0)
        
        let loginVC = LogInViewController()
        loginVC.view.backgroundColor = .lightGray
        loginVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.rectangle.fill"), tag: 1)
        
        let feedNC = UINavigationController(rootViewController: feedVC)
        let loginNC = UINavigationController(rootViewController: loginVC)
        loginNC.navigationBar.isHidden = true
        tabBarController.viewControllers = [feedNC, loginNC]
        
        window?.rootViewController = tabBarController
    }
}
