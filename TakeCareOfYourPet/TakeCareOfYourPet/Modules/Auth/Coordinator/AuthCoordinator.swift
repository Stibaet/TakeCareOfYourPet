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
    private let databaseService: DatabaseServiceProtocol
    
    //MARK: - init
    init(navigationController: UINavigationController, authService: AuthServiceProtocol,
         databaseService: DatabaseServiceProtocol, onAuthSuccess: (() -> Void)?) {
        self.navigationController = navigationController
        self.onAuthSuccess = onAuthSuccess
        self.authService = authService
        self.databaseService = databaseService
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
        let signInPresenter = SignInPresenter(authService: authService)
        signInPresenter.navigationDelegate = self
        let signInVC = SignInViewController(presenter: signInPresenter)
        signInPresenter.view = signInVC
        navigationController.pushViewController(signInVC, animated: true)
    }
    
    func showSignUpScreen() {
        let signUpPresenter = SignUpPresenter(authService: authService, databaseService: databaseService)
        signUpPresenter.navigationDelegate = self
        let signUpVC = SignUpViewController(presenter: signUpPresenter)
        signUpPresenter.view = signUpVC
        navigationController.pushViewController(signUpVC, animated: true)
    }
}

//MARK: - SignUpNavigationDelegate
extension AuthCoordinator: SignUpNavigationDelegate {
    func didSignUpSuccesfully() {
        print("[AuthCoordinator] didSignUp")
        onAuthSuccess?()
    }
}

//MARK: - SignInNavigationDelegate
extension AuthCoordinator: SignInNavigationDelegate {
    func didSignInSuccesfully() {
        print("[AuthCoordinator] didSignIn")
    }
}
