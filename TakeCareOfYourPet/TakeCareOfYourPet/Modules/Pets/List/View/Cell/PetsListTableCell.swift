//
//  PetsListTableCell.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 30.04.2025.
//

import UIKit

class PetsListTableCell: UITableViewCell {
    static let reuseID = "PetTableCell"
    
    //MARK: - UI
    private lazy var nameLabel = UILabel(text: "PetName", font: .systemFont(ofSize: 16, weight: .regular), textColor: .black80, alignment: .left)
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - private methods
private extension PetsListTableCell {
    func configureUI() {
        backgroundColor = .systemBlue
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        ])
        
    }
}
