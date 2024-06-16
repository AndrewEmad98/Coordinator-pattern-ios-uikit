//
//  AppCoordinator.swift
//  Coordinator-pattern
//
//  Created by Andrew Emad on 16/06/2024.
//

import UIKit

class AppCoordinator: ParentCoordinator {
    internal var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        // logic to detect the navigation
        self.goHome()
    }
    
    deinit {
        print("deinit for coordinator \(Self.self)")
    }
}

//MARK: - App Navigations
extension AppCoordinator{
    func goHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        addChildCoordinator(child: homeCoordinator)
        homeCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
