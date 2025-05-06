//
//  SignInPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

class SignInPresenter {
    private weak var navigationDelegate: SignInNavigationDelegate?
    private let authService: AuthServiceProtocol
    
    init(navigationDelegate: SignInNavigationDelegate, authService: AuthServiceProtocol) {
        self.navigationDelegate = navigationDelegate
        self.authService = authService
    }
}
