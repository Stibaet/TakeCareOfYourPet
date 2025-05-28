//
//  SingInViewProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 27.05.2025.
//

protocol SignInViewProtocol: AnyObject {
    func showWarning(_ warning: String)
    func updateSignInState(_ state: SignInUserResult, onDismiss: (() -> Void)?)
    var isLabelHidden: Bool { get set }
}
