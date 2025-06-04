//
//  PetsListViewController.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 29.04.2025.
//

import UIKit

final class PetsListViewController: UIViewController {
    
    //MARK: - UI
    private lazy var petsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PetsListTableCell.self, forCellReuseIdentifier: PetsListTableCell.reuseID)
        tableView.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    //MARK: - properties
    private let presenter: PetsListPresenterProtocol
    
    //MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - init
    init(presenter: PetsListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private methods
private extension PetsListViewController {
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
    
    func configureNavBar() {
        let addAction = UIAction { [weak self] _ in
            self?.presenter.didTapAddButton()
        }
        navigationItem.title = "Питомцы"
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addAction)
    }
}

//MARK: - UITableViewDataSource
extension PetsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PetsListTableCell.reuseID, for: indexPath)
        
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate
extension PetsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

//MARK: - pets view protocol methods
extension PetsListViewController: PetsListViewProtocol {
    
}
