//
//  SignUpViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - UI
    private lazy var emailTF = UITextField(placeholder: "Email", delegate: self, returnKeyType: .next, keyboardType: .emailAddress)
    private lazy var passwordTF = UITextField(placeholder: "Password", delegate: self, returnKeyType: .done, keyboardType: .default)
    private lazy var confirmPasswordTF = UITextField(placeholder: "Password", delegate: self, returnKeyType: .done, keyboardType: .default)
    
    private lazy var warningLabel = UILabel(lines: 0, font: .systemFont(ofSize: 14, weight: .regular), textColor: .systemRed, alignment: .left, isHidden: true)
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - properties
    private let presenter: SignUpPresenter
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - init
    init(presenter: SignUpPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private methods
private extension SignUpViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        let tfStack = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 8, arrangedSubviews: [emailTF, passwordTF, confirmPasswordTF, warningLabel])
        view.addSubview(tfStack)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            tfStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tfStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tfStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            
            signUpButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    @objc func signUpButtonTapped() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let passwordToConfirm = confirmPasswordTF.text ?? ""
        
        presenter.didTapSignUpButton(email: email, password: password, passwordToConfirm: passwordToConfirm)
        
        print("email \(email)")
        print("password \(password)")
        print("confirmedPass = \(passwordToConfirm)")
    }
}


//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTF: passwordTF.becomeFirstResponder()
        case passwordTF: confirmPasswordTF.becomeFirstResponder()
        case confirmPasswordTF: view.endEditing(true)
        default: break
        }
        return true
    }
}

//MARK: - SighUpViewProtocol
extension SignUpViewController: SignUpViewProtocol {
    var isLabelHidden: Bool {
        get {
            warningLabel.isHidden
        }
        set {
            warningLabel.isHidden = newValue
        }
    }
    
    func showWarning(warning: String) {
        warningLabel.isHidden = false
        warningLabel.text = warning
    }
}
