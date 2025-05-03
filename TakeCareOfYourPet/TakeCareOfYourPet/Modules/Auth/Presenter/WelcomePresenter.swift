//
//  WelcomePresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

class WelcomePresenter {
    private weak var navigationDelegate: WelcomeNavigationDelegate?
    
    init(navigationDelegate: WelcomeNavigationDelegate) {
        print("[WelcomePresenter] init with delegate: \(navigationDelegate)")
        self.navigationDelegate = navigationDelegate
    }
    
    func didTapSignUpButton() {
        print("delegate \(navigationDelegate)")
        navigationDelegate?.showSignUpScreen()
    }
    
    func didTapSignInButton() {
        navigationDelegate?.showSignInScreen()
    }
    
    deinit {
        print("[WelcomePresenter] deinit")
    }

}
