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
}
