//
//  PetsListPresenter.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 31.05.2025.
//

final class PetsListPresenter {
    
    //MARK: - properties
    weak var view: PetsListViewProtocol?
    weak var navigationDelegate: PetsListNavigationDelegate?
    
    
}

//MARK: - pets presenter protocol methods
extension PetsListPresenter: PetsListPresenterProtocol {
    func didTapAddButton() {
        navigationDelegate?.showCreatePetScreen()
    }
}
