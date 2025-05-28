//
//  SignInViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: - UI
    private lazy var emailTF = UITextField(placeholder: "Email", delegate: self, returnKeyType: .next, keyboardType: .emailAddress)
    private lazy var passwordTF = UITextField(placeholder: "Password", delegate: self, returnKeyType: .done, keyboardType: .default)
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private lazy var warningLabel = UILabel(lines: 0, font: .systemFont(ofSize: 14, weight: .regular), textColor: .systemRed, alignment: .left, isHidden: true)
    
    //MARK: - properties
    private let presenter: SignInPresenterProtocol
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - init
    init(presenter: SignInPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private methods
private extension SignInViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        let tfStack = UIStackView(axis: .vertical, distribution: .fillEqually, spacing: 8, arrangedSubviews: [emailTF, passwordTF, warningLabel])
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
    
    @objc func signInButtonTapped() {
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        presenter.didTapSignInButton(email: email, password: password)
    }
    
    func showLoadingAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        alert.view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor),
            spinner.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -10)
        ])
        present(alert, animated: true)
    }
    
    func showSuccessAlert(title: String, message: String, onDismiss: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Вперёд!", style: .default) { _ in
            onDismiss?()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Понятно", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}



//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            view.endEditing(true)
        default:
            break
        }
        return true
    }
}

//MARK: - SignInViewProtocol
extension SignInViewController: SignInViewProtocol {
    func showWarning(_ warning: String) {
        warningLabel.isHidden = false
        warningLabel.text = warning
    }
    
    func updateSignInState(_ state: SignInUserResult, onDismiss: (() -> Void)?) {
        switch state {
        case .inProgress:
            showLoadingAlert(title: state.title, message: state.message)
        case .success:
            showSuccessAlert(title: state.title, message: state.message, onDismiss: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        case .failure(let error):
            showErrorAlert(title: state.title, message: state.message)
        }
    }
    
    var isLabelHidden: Bool {
        get {
            warningLabel.isHidden
        }
        set {
            warningLabel.isHidden = newValue
        }
    }
    
    
}
