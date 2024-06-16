//
//  SettingsViewController.swift
//  Coordinator-pattern
//
//  Created by Andrew Emad on 16/06/2024.
//

import UIKit

class SettingsViewController: UIViewController {

    weak var settingsCoordinator: SettingsNavigationProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        settingsCoordinator?.disAppear()
    }


    @IBAction func homeTapped(_ sender: Any) {
        settingsCoordinator?.goToHome()
    }
    
}
