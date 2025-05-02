//
//  Untitled.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import UIKit

class AuthCoordinator: NavigationCoordinator {
    var navigationController: UINavigationController
    var onAuthSuccess: (() -> Void)?
    
    init(navigationController: UINavigationController, onAuthSuccess: (() -> Void)? = nil) {
        self.navigationController = navigationController
        self.onAuthSuccess = onAuthSuccess
    }
    
    func start() {
        showWelcomeScreen()
    }
    
    func showWelcomeScreen() {
        let welcomePresenter = WelcomePresenter()
        let welcomeVC = WelcomeViewController()
        navigationController.setViewControllers([welcomeVC], animated: false)
    }
    
    func showSignInScreen() {
        let signInPresenter = SignInPresenter()
        let signInVC = SignInViewController()
        navigationController.pushViewController(signInVC, animated: true)
    }
    
    func showSignUpScreen() {
        let signUpPresenter = SignUpPresenter()
        let signUpVC = SignUpViewController()
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
}
