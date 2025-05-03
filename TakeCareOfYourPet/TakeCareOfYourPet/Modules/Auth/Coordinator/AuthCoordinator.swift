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
        print("start auth flow")
        let welcomePresenter = WelcomePresenter(navigationDelegate: self)
        let welcomeVC = WelcomeViewController(presenter: welcomePresenter)
        navigationController.setViewControllers([welcomeVC], animated: false)
    }
}

extension AuthCoordinator: WelcomeNavigationDelegate {
    func showSignInScreen() {
        let signInPresenter = SignInPresenter(navigationDelegate: self)
        let signInVC = SignInViewController(presenter: signInPresenter)
        navigationController.pushViewController(signInVC, animated: true)
    }
    
    func showSignUpScreen() {
        let signUpPresenter = SignUpPresenter(navigationDelegate: self)
        let signUpVC = SignUpViewController(presenter: signUpPresenter)
        navigationController.pushViewController(signUpVC, animated: true)
    }
}

extension AuthCoordinator: SignUpNavigationDelegate {
    func didSignUpSuccesfully() {
        print("[AuthCoordinator] didSignUp")
    }
}

extension AuthCoordinator: SignInNavigationDelegate {
    func didSignInSuccesfully() {
        print("[AuthCoordinator] didSignIn")
    }
}
