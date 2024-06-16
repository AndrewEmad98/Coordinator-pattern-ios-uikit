//
//  AppCoordinator.swift
//  Coordinator-pattern
//
//  Created by Andrew Emad on 16/06/2024.
//

import UIKit

protocol SettingsNavigationProtocol: AnyObject {
    func goToHome()
    func disAppear()
}

class SettingsCoordinator: ChildCoordinator {
    var navigationController: UINavigationController
    var parentCoordinator: ParentCoordinator?
    
    init(parentCoordinator: ParentCoordinator?, navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
    }
    
    func start() {
        let settignsVC = SettingsViewController()
        settignsVC.settingsCoordinator = self
        navigationController.pushViewController(settignsVC, animated: true)
    }

    deinit {
        print("deinit for coordinator \(Self.self)")
    }
}

extension SettingsCoordinator: SettingsNavigationProtocol {
    func goToHome() {
        navigationController.popViewController(animated: true)
        parentCoordinator?.childDidFinish(child: self)
    }
    
    func disAppear() {
        parentCoordinator?.childDidFinish(child: self)
    }
    
    
}
