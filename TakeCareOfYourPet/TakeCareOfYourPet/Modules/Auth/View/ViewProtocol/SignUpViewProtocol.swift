//
//  SignUpViewProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

protocol SignUpViewProtocol: AnyObject {
    func showWarning(warning: String)
    var isLabelHidden: Bool { get set }
}
