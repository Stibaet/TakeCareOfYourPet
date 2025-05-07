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
    
    //MARK: - properties
    private let authService: AuthServiceProtocol
    
    //MARK: - init
    init(navigationController: UINavigationController, authService: AuthServiceProtocol, onAuthSuccess: (() -> Void)? = nil) {
        self.navigationController = navigationController
        self.onAuthSuccess = onAuthSuccess
        self.authService = authService
    }
    
    //MARK: - public methods
    func start() {
        print("start auth flow")
        let welcomePresenter = WelcomePresenter(navigationDelegate: self)
        let welcomeVC = WelcomeViewController(presenter: welcomePresenter)
        navigationController.setViewControllers([welcomeVC], animated: false)
    }
}

//MARK: - WelcomeNavigationDelegate
extension AuthCoordinator: WelcomeNavigationDelegate {
    func showSignInScreen() {
        let signInPresenter = SignInPresenter(navigationDelegate: self, authService: authService)
        let signInVC = SignInViewController(presenter: signInPresenter)
        navigationController.pushViewController(signInVC, animated: true)
    }
    
    func showSignUpScreen() {
        let signUpPresenter = SignUpPresenter(navigationDelegate: self, authService: authService)
        let signUpVC = SignUpViewController(presenter: signUpPresenter)
        signUpPresenter.view = signUpVC
        navigationController.pushViewController(signUpVC, animated: true)
    }
}

//MARK: - SignUpNavigationDelegate
extension AuthCoordinator: SignUpNavigationDelegate {
    func didSignUpSuccesfully() {
        print("[AuthCoordinator] didSignUp")
    }
}

//MARK: - SignInNavigationDelegate
extension AuthCoordinator: SignInNavigationDelegate {
    func didSignInSuccesfully() {
        print("[AuthCoordinator] didSignIn")
    }
}
