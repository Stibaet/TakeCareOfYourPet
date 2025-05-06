//
//  SignUpPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

class SignUpPresenter {
    private weak var navigationDelegate: SignUpNavigationDelegate?
    private let authService: AuthServiceProtocol
    weak var view: SignUpViewProtocol?
    
    
    init(navigationDelegate: SignUpNavigationDelegate, authService: AuthServiceProtocol) {
        self.navigationDelegate = navigationDelegate
        self.authService = authService
    }
    
    func didTapSignUpButton(email: String, password: String, confirmPassword: String) {
        authService.signUp(email: email, password: password, completion: <#T##(Result<UserModel, any Error>) -> Void#>)
    }
}
