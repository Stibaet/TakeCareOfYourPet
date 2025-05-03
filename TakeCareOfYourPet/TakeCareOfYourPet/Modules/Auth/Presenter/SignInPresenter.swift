//
//  SignInPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

class SignInPresenter {
    private weak var navigationDelegate: SignInNavigationDelegate?
    
    init(navigationDelegate: SignInNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
    }
}
