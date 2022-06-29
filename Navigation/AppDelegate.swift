//
//  AppDelegate.swift
//  Navigation
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let coordinator: GeneralCoordinator = RootCoordinator()

        appendArrayPhotos()
        self.window?.rootViewController = coordinator.startApplication(userData: nil)

        NetworkManager.shared.dataTitle()
        NetworkManager.shared.dataPlanet()
//        let appConfiguration = AppConfiguration.randomURL()
//        NetworkManager.shared.fetchData(url: appConfiguration)
        
        return true
    }
}
