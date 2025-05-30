//
//  CoreDataServiceProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 07.05.2025.
//

protocol CoreDataServiceProtocol {
    func saveUser(user: UserModel, completion: @escaping (() -> Void))
}
