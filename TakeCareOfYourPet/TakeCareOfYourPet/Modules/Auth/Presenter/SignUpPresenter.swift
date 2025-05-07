//
//  SignUpPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

class SignUpPresenter {
    weak var navigationDelegate: SignUpNavigationDelegate?
    private let authService: AuthServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    weak var view: SignUpViewProtocol?
    
    
    init(authService: AuthServiceProtocol, databaseService: DatabaseServiceProtocol) {
        self.authService = authService
        self.databaseService = databaseService
    }
    
    func didTapSignUpButton(email: String, password: String, passwordToConfirm: String) {
        guard !email.isEmpty else {
            print("[SignUpPresenter] email is empty")
            view?.showWarning(warning: "Email не может быть пустым")
            return
        }
        
        guard password.count >= 6 else {
            print("[SignUpPresenter] password.count <= 6")
            view?.showWarning(warning: "Пароль должен состоять из 6 или более символов")
            return
        }
        
        guard password == passwordToConfirm else {
            print("[SignUpPresenter] password != passwordToConfirm")
            view?.showWarning(warning: "Пароли должны совпадать")
            return
        }
        
        view?.isLabelHidden = true
    }
}
