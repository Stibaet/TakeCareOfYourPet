//
//  SettingsCoordinator.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 30.04.2025.
//

import UIKit

class SettingsCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {
        let settingsVC = SettingsViewController()
        navigationController.viewControllers = [settingsVC]
    }
}
