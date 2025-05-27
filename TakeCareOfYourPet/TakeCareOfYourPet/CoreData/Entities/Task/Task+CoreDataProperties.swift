//
//  Task+CoreDataProperties.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 29.04.2025.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var definition: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var dueDate: Date
    @NSManaged public var pet: Pet

}

extension Task : Identifiable {

}
