//
//  SettingsPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 29.05.2025.
//

final class SettingsPresenter {
    
    //MARK: - properties
    weak var view: SettingsViewController?
    weak var navigationDelegate: SettingsNavigationDelegate?
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
}

//MARK: - SettingsPresenterProtocol
extension SettingsPresenter: SettingsPresenterProtocol {
    func didTapLogoutButton() {
        authService.logout { [weak self] result in
            switch result {
            case .success(_):
                self?.navigationDelegate?.didLogoutSuccessfully()
            case .failure(let error):
                printError("logout error \(error.localizedDescription)")
            }
        }
        
    }
}
