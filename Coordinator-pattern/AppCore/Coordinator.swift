//
//  Coordinator.swift
//  Coordinator-pattern
//
//  Created by Andrew Emad on 16/06/2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}

//MARK: - Configure Parent Coordinator
protocol ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func addChildCoordinator(child: Coordinator)
    func childDidFinish(child: Coordinator)
}

extension ParentCoordinator {
    func addChildCoordinator(child: Coordinator) {
        childCoordinators.append(child)
    }
    
    func childDidFinish(child: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator in
            child === coordinator
        }){
            childCoordinators.remove(at: index)
        }
    }
}

//MARK: - Configure Child Coordinator
protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? { get set }
    func didFinish()
}

extension ChildCoordinator {
    func didFinish() {
        parentCoordinator?.childDidFinish(child: self)
    }
}
