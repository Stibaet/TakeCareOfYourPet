//
//  SettingsViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 30.04.2025.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("sign out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let presenter: SettingsPresenterProtocol
    
    init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension SettingsViewController {
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.heightAnchor.constraint(equalToConstant: 35),
            logoutButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    @objc func logoutButtonTapped() {
        presenter.didTapLogoutButton()
    }
}

//MARK: - SettingsViewProtocol
extension SettingsViewController: SettingsViewProtocol {
    
}
