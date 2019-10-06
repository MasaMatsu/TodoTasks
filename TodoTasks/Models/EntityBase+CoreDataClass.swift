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
            if createdAt == nil {
                createdAt = now
            }
            if updatedAt == nil {
                updatedAt = now
            }
        }
        else if isUpdated {
            if updatedAt == nil || now.timeIntervalSince(updatedAt!) > 1.0 {
                updatedAt = now
            }
        }

        if isLogicalDeleted {
            if logicalDeletedAt == nil {
                logicalDeletedAt = now
            }
        }
        else {
            if logicalDeletedAt != nil {
                logicalDeletedAt = nil
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
