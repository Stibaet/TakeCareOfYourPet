//
//  DependencyAssembly.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 07.05.2025.
//

final class DependencyAssembly {
    let authService: AuthServiceProtocol
    let databaseService: DatabaseServiceProtocol
    let coreDataService: CoreDataServiceProtocol
    private let viewContext = CoreDataStack.shared.persistentContainer.viewContext
    private let backgroundContext = CoreDataStack.shared.persistentContainer.newBackgroundContext()
    
    init() {
        authService = AuthService()
        coreDataService = CoreDataService(viewContext: viewContext, backgroundContext: backgroundContext)
        databaseService = DatabaseService(coreDataService: coreDataService)
    }
}
