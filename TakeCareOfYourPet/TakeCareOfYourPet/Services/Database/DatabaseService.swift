//
//  DatabaseService.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 06.05.2025.
//

import CoreData

class DatabaseService {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
}
