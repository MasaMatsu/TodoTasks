//
// Task+CoreDataProperties.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var limit: Date?
    @NSManaged public var name: String?
    @NSManaged public var category: Category?
}
