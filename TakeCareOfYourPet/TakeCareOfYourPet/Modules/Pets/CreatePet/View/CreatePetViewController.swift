//
//  CreatePetViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 04.06.2025.
//

import UIKit

final class CreatePetViewController: UIViewController {
    
    //MARK: - UI
    
    //MARK: - properties
    private let presenter: CreatePetPresenterProtocol
    
    init(presenter: CreatePetPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

//MARK: - private methods
private extension CreatePetViewController {
    func configureUI() {
        view.backgroundColor = .systemBlue
    }
}
