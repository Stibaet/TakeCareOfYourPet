//
//  WelcomePresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

class WelcomePresenter {
    private weak var navigationDelegate: WelcomeNavigationDelegate?
    
    init(navigationDelegate: WelcomeNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
    
    func didTapSignUpButton() {
        navigationDelegate?.showSignUpScreen()
    }
    
    func didTapSignInButton() {
        navigationDelegate?.showSignInScreen()
    }
    
    deinit {
        print("[WelcomePresenter] deinit")
    }

}
