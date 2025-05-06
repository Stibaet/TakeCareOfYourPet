//
//  DatabaseServiceProtocol.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

protocol DatabaseServiceProtocol {
    func saveUser(user: UserModel, completion: @escaping (Result<Void, Error>) -> Void)
}
