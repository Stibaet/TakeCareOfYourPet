//
//  PetsViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 29.04.2025.
//

import UIKit

class PetsViewController: UIViewController {
    
    //MARK: - UI
    private lazy var petsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PetTableCell.self, forCellReuseIdentifier: PetTableCell.reuseID)
        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
}

//MARK: - private methods
private extension PetsViewController {
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(petsTableView)
        
        NSLayoutConstraint.activate([
            petsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            petsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            petsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            petsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension PetsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PetTableCell.reuseID, for: indexPath)
        
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate
extension PetsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
