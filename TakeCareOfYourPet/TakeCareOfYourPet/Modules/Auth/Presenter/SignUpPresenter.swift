//
//  SignUpPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import Foundation

enum CreateUserResult {
    case inProgress
    case success
    case failure(error: CreateUserError)
    
    var title: String {
        switch self {
        case .inProgress: "Создаём аккаунт..."
        case .success: "Аккаунт успешно создан"
        case .failure(let error): error.title
        }
    }
    
    var message: String {
        switch self {
        case .inProgress: "Пожалуйста, подождите немного"
        case .success: "Добро пожаловать!"
        case .failure(let error): error.description
        }
    }
}

final class SignUpPresenter {
    
    //MARK: - properties
    weak var navigationDelegate: SignUpNavigationDelegate?
    weak var view: SignUpViewProtocol?
    private let authService: AuthServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    
    //MARK: - init
    init(authService: AuthServiceProtocol, databaseService: DatabaseServiceProtocol) {
        self.authService = authService
        self.databaseService = databaseService
    }
    
    //MARK: - public methods
    func didTapSignUpButton(email: String, password: String, passwordToConfirm: String) {
        guard !email.isEmpty else {
            printError("[SignUpPresenter] email is empty")
            view?.showWarning(warning: "Email не может быть пустым")
            return
        }
        
        guard password.count >= 6 else {
            printError("[SignUpPresenter] password.count <= 6")
            view?.showWarning(warning: "Пароль должен состоять из 6 или более символов")
            return
        }
        
        guard password == passwordToConfirm else {
            printError("[SignUpPresenter] password != passwordToConfirm")
            view?.showWarning(warning: "Пароли должны совпадать")
            return
        }
        
        view?.isLabelHidden = true
        view?.updateSignUpState(state: .inProgress, onDismiss: nil)
        
        authService.signUp(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                databaseService.saveUser(user: user) { [weak self] in
                    DispatchQueue.main.async {
                        self?.view?.updateSignUpState(state: .success, onDismiss: {
                            self?.navigationDelegate?.didSignUpSuccesfully()
                        })
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.updateSignUpState(state: .failure(error: error), onDismiss: nil)
                }
            }
        }
    }
}
