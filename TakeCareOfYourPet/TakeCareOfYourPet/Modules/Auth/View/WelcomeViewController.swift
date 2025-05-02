//
//  WelcomeViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - UI
    private lazy var welcomeLabel = UILabel(text: "Hello!", font: .systemFont(ofSize: 16, weight: .regular), textColor: .black, alignment: .center)
    private lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    //MARK: - override
    override func viewDidLoad() {
        configureUI()
    }
}

//MARK: - private methods
private extension WelcomeViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        let buttonsStack = UIStackView(axis: .vertical, distribution: .equalSpacing, spacing: 10, arrangedSubviews: [signInButton, signUpButton])
        
        view.addSubview(welcomeLabel)
        view.addSubview(buttonsStack)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            
            signInButton.heightAnchor.constraint(equalToConstant: 35),
            signUpButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
