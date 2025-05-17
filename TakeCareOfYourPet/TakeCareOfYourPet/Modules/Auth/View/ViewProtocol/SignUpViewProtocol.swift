//
//  SignUpViewProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

protocol SignUpViewProtocol: AnyObject {
    func showWarning(warning: String)
    func updateSignUpState(state: CreateUserResult, onDismiss: (() -> Void)?)
    var isLabelHidden: Bool { get set }
}
