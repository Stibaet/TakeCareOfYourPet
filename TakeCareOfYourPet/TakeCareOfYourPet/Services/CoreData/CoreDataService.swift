//
//  CoreDataService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 07.05.2025.
//

import CoreData

final class CoreDataService: CoreDataServiceProtocol {
        
    private let viewContext: NSManagedObjectContext
    private let backgroundContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext, backgroundContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        self.backgroundContext = backgroundContext
    }
    
    func saveUser(user: UserModel, completion: @escaping () -> Void) {
        backgroundContext.perform { [weak self] in
            guard let self = self else { return }
            let userEntity = User(context: backgroundContext, model: user)
            
            do {
                try backgroundContext.save()
                printLog("[CoreDataService] user saved \(userEntity)")
                DispatchQueue.main.async {
                    completion()
                }
            }
            catch {
                printError("[CoreDataService] saving user failure")
            }
        }
    }
}
