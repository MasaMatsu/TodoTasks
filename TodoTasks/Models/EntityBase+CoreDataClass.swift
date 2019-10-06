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

        // FIXME: This logic makes infinity loop.
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

    /// Logically delete this record.
    ///
    /// Apple does not recommend inheriting NSManagedObjectContext.
    /// (see "Subclassing Notes" in https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext)
    /// So I define logically delete in Model.
    public func delete() {
        isLogicalDeleted = true
    }

    /// Physically delete this record.
    public func deletePhysically(context: NSManagedObjectContext) {
        context.delete(self)
    }
}
