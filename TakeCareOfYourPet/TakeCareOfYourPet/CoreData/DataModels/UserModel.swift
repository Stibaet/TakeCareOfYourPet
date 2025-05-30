//
//  UserModel.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 05.05.2025.
//

import Foundation

struct UserModel {
    var id: String
    var name: String
    var email: String
    var pets: [PetModel]
    
    init(entity: User) {
        id = entity.id
        name = entity.name
        email = entity.email
        pets = entity.pets?.compactMap { $0 as? Pet }.map { PetModel(entity: $0) } ?? []
    }
    
    init(id: String, name: String, email: String, pets: [PetModel]) {
        self.id = id
        self.name = name
        self.email = email
        self.pets = pets
    }
}
