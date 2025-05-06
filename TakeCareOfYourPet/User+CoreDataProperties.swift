//
//  User+CoreDataProperties.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 29.04.2025.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String
    @NSManaged public var id: String
    @NSManaged public var email: String
    @NSManaged public var pets: NSOrderedSet?

}

// MARK: Generated accessors for pets
extension User {

    @objc(insertObject:inPetsAtIndex:)
    @NSManaged public func insertIntoPets(_ value: Pet, at idx: Int)

    @objc(removeObjectFromPetsAtIndex:)
    @NSManaged public func removeFromPets(at idx: Int)

    @objc(insertPets:atIndexes:)
    @NSManaged public func insertIntoPets(_ values: [Pet], at indexes: NSIndexSet)

    @objc(removePetsAtIndexes:)
    @NSManaged public func removeFromPets(at indexes: NSIndexSet)

    @objc(replaceObjectInPetsAtIndex:withObject:)
    @NSManaged public func replacePets(at idx: Int, with value: Pet)

    @objc(replacePetsAtIndexes:withPets:)
    @NSManaged public func replacePets(at indexes: NSIndexSet, with values: [Pet])

    @objc(addPetsObject:)
    @NSManaged public func addToPets(_ value: Pet)

    @objc(removePetsObject:)
    @NSManaged public func removeFromPets(_ value: Pet)

    @objc(addPets:)
    @NSManaged public func addToPets(_ values: NSOrderedSet)

    @objc(removePets:)
    @NSManaged public func removeFromPets(_ values: NSOrderedSet)

}

extension User : Identifiable {

}
