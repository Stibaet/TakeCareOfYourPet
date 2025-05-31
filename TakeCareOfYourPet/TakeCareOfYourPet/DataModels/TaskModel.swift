//
//  Untitled.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 05.05.2025.
//

import Foundation

struct TaskModel {
    var id: String
    var title: String
    var definition: String?
    var isCompleted: Bool
    var dueDate: Date
    var pet: PetModel
    
    init(entity: Task) {
        id = entity.id
        title = entity.title
        definition = entity.definition
        isCompleted = entity.isCompleted
        dueDate = entity.dueDate
        pet = PetModel(entity: entity.pet)
    }
}
