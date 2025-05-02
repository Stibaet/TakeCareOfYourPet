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
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

//MARK: - private methods
private extension SignUpViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        let tfStack = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 8, arrangedSubviews: [emailTF, passwordTF, confirmPasswordTF])
        view.addSubview(tfStack)
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            tfStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tfStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tfStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            
            signInButton.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
}



//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    
}
