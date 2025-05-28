//
//  SignInPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import Foundation

enum SignInUserResult {
    case inProgress
    case success
    case failure(error: SignInUserError)
    
    var title: String? {
        switch self {
        case .inProgress: "Пожалуйста, подождите немного"
        case .success: nil
        case .failure(let error): error.errorTitle
        }
    }
    
    var message: String {
        switch self {
        case .inProgress: "Идёт процесс авторизации..."
        case .success: "Добро пожаловать!"
        case .failure(let error): error.errorMessage
        }
    }
}

class SignInPresenter {
    
    //MARK: - properties
    weak var navigationDelegate: SignInNavigationDelegate?
    weak var view: SignInViewProtocol?
    private let authService: AuthServiceProtocol
    
    
    //MARK: - init
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
}

//MARK: - SignInPresenterProtocol
extension SignInPresenter: SignInPresenterProtocol {
    func didTapSignInButton(email: String, password: String) {
        guard !email.isEmpty else {
            printError("[SignUpPresenter] email is empty")
            view?.showWarning("Email не может быть пустым")
            return
        }
        
        guard password.count >= 6 else {
            printError("[SignUpPresenter] password.count <= 6")
            view?.showWarning("Пароль должен состоять из 6 или более символов")
            return
        }
        
        view?.isLabelHidden = true
        view?.updateSignInState(.inProgress, onDismiss: nil)
        
        authService.signIn(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.view?.updateSignInState(.success) {
                        self.navigationDelegate?.didSignInSuccesfully()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.updateSignInState(.failure(error: error), onDismiss: nil)
                }
            }
        }
    }
}
