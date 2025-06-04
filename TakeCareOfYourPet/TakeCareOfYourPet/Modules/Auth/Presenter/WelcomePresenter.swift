//
//  WelcomePresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

final class WelcomePresenter: WelcomePresenterProtocol {
    weak var navigationDelegate: WelcomeNavigationDelegate?
    
    func didTapSignUpButton() {
        navigationDelegate?.showSignUpScreen()
    }
    
    func didTapSignInButton() {
        navigationDelegate?.showSignInScreen()
    }
    
    deinit {
        printDeinit(self)
    }

}
