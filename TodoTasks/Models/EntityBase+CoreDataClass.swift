//
// EntityBase+CoreDataClass.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Foundation
import CoreData

@objc(EntityBase)
public class EntityBase: NSManagedObject {

    public override func willSave() {
        super.willSave()

        let now = Date()
        if isInserted {
            createdAt = now
            updatedAt = now
        }
        else if isUpdated {
            updatedAt = now
            if isLogicalDeleted {
                logicalDeletedAt = now
            }
        }
    }
}
