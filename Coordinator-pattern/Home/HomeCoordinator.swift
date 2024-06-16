//
//  AppCoordinator.swift
//  Coordinator-pattern
//
//  Created by Andrew Emad on 16/06/2024.
//

import UIKit


protocol HomeNavigationProtocol: AnyObject {
    func goToSettings()
}

class HomeCoordinator: ParentCoordinator {
    internal var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    deinit {
        print("deinit for coordinator \(Self.self)")
    }

}

extension HomeCoordinator: HomeNavigationProtocol {
    func goToSettings() {
        let settingsCoordinator = SettingsCoordinator(parentCoordinator: self, navigationController: navigationController)
        addChildCoordinator(child: settingsCoordinator)
        settingsCoordinator.start()
    }
}
