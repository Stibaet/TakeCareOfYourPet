//
//  SignUpViewProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

protocol SignUpViewProtocol: AnyObject {
    func showWarning(_ warning: String)
    func updateSignUpState(_ state: SignUpUserResult, onDismiss: (() -> Void)?)
    var isLabelHidden: Bool { get set }
}
