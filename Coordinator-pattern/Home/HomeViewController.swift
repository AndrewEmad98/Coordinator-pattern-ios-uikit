//
//  HomeViewController.swift
//  Coordinator-pattern
//
//  Created by Andrew Emad on 16/06/2024.
//

import UIKit

class HomeViewController: UIViewController {

    weak var coordinator: HomeNavigationProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func settingsTapped(_ sender: Any) {
        coordinator?.goToSettings()
    }
}
