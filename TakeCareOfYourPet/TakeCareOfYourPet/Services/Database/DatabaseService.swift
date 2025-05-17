//
//  DatabaseService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

class DatabaseService: DatabaseServiceProtocol {
    private let coreDataService: CoreDataServiceProtocol
    
    init(coreDataService: CoreDataServiceProtocol) {
        self.coreDataService = coreDataService
    }
    
    
    func saveUser(user: UserModel, completion: @escaping (() -> Void)) {
        coreDataService.saveUser(user: user, completion: completion)
    }
}
