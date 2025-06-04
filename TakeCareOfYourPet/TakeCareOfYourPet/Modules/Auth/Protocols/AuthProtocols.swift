//
//  AuthProtocols.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 04.06.2025.
//


//MARK: - view
protocol SignInViewProtocol: AnyObject {
    func showWarning(_ warning: String)
    func updateSignInState(_ state: SignInUserResult, onDismiss: (() -> Void)?)
    var isLabelHidden: Bool { get set }
}

protocol SignUpViewProtocol: AnyObject {
    func showWarning(_ warning: String)
    func updateSignUpState(_ state: SignUpUserResult, onDismiss: (() -> Void)?)
    var isLabelHidden: Bool { get set }
}

//MARK: - presenter
protocol SignInPresenterProtocol {
    func didTapSignInButton(email: String, password: String)
}

protocol SignUpPresenterProtocol {
    func didTapSignUpButton(email: String, password: String, passwordToConfirm: String)
}

protocol WelcomePresenterProtocol {
    func didTapSignUpButton()
    func didTapSignInButton()
}
