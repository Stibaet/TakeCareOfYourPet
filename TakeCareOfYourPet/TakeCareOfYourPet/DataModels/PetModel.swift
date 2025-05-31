//
//  PetModel.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 05.05.2025.
//

import Foundation

struct PetModel {
    var id: String
    var name: String
    var age: Int
    var breed: String
    var weight: Int
    var type: String
    var isNeutered: Bool
    var owner: UserModel
    var tasks: [TaskModel]
    
    init(entity: Pet) {
        id = entity.id
        name = entity.name
        age = Int(entity.age)
        breed = entity.breed
        weight = Int(entity.weight)
        type = entity.type
        isNeutered = entity.isNeutered
        owner = UserModel(entity: entity.owner)
        tasks = entity.tasks?.compactMap { $0 as? Task }.map { TaskModel(entity: $0) } ?? []        
    }
}
