//
//  Pet+CoreDataProperties.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 29.04.2025.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var age: Int16
    @NSManaged public var breed: String
    @NSManaged public var weight: Int16
    @NSManaged public var type: String
    @NSManaged public var isNeutered: Bool
    @NSManaged public var owner: User
    @NSManaged public var tasks: NSOrderedSet?
    
    convenience init(context: NSManagedObjectContext, model: PetModel, owner: User) {
        self.init(context: context)
        self.id = model.id
        self.name = model.name
        self.age = Int16(model.age)
        self.breed = model.breed
        self.weight = Int16(model.weight)
        self.type = model.type
        self.isNeutered = model.isNeutered
        self.owner = owner
        self.tasks = NSOrderedSet(array: model.tasks)
    }

}

// MARK: Generated accessors for tasks
extension Pet {

    @objc(insertObject:inTasksAtIndex:)
    @NSManaged public func insertIntoTasks(_ value: Task, at idx: Int)

    @objc(removeObjectFromTasksAtIndex:)
    @NSManaged public func removeFromTasks(at idx: Int)

    @objc(insertTasks:atIndexes:)
    @NSManaged public func insertIntoTasks(_ values: [Task], at indexes: NSIndexSet)

    @objc(removeTasksAtIndexes:)
    @NSManaged public func removeFromTasks(at indexes: NSIndexSet)

    @objc(replaceObjectInTasksAtIndex:withObject:)
    @NSManaged public func replaceTasks(at idx: Int, with value: Task)

    @objc(replaceTasksAtIndexes:withTasks:)
    @NSManaged public func replaceTasks(at indexes: NSIndexSet, with values: [Task])

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSOrderedSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSOrderedSet)

}

extension Pet : Identifiable {

}
