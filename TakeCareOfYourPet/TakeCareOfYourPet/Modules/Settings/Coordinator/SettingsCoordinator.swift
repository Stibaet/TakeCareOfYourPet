//
//  SettingsCoordinator.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 30.04.2025.
//

import UIKit

final class SettingsCoordinator: NavigationCoordinator {
    
    //MARK: - properties
    var navigationController: UINavigationController
    var onLogoutSuccess: (() -> Void)?
    private let authService: AuthServiceProtocol
    
    init(navigationController: UINavigationController, authService: AuthServiceProtocol, onLogoutSuccess: (() -> Void)?) {
        self.navigationController = navigationController
        self.authService = authService
        self.onLogoutSuccess = onLogoutSuccess
    }
    
    func start() {
        let presenter = SettingsPresenter(authService: authService)
        presenter.navigationDelegate = self
        let settingsVC = SettingsViewController(presenter: presenter)
        presenter.view = settingsVC
        navigationController.viewControllers = [settingsVC]
    }
}

//MARK: - SettingsNavigationDelegate
extension SettingsCoordinator: SettingsNavigationDelegate {
    func didLogoutSuccessfully() {
        onLogoutSuccess?()
    }
}
