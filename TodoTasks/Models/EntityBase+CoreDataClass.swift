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
        let now = Date()
        if isInserted {
            if createdAt == nil {
                setPrimitiveValue(now, forKey: #keyPath(createdAt))
                DebugLog.write(obj: "Set createdAt at inserted")
            }
            if updatedAt == nil {
                setPrimitiveValue(now, forKey: #keyPath(updatedAt))
                DebugLog.write(obj: "Set updatedAt at inserted")
            }
        }
        else if isUpdated {
            setPrimitiveValue(now, forKey: #keyPath(updatedAt))
            DebugLog.write(obj: "Set updatedAt at updated")
        }

        if primitiveValue(forKey: #keyPath(isLogicalDeleted)) as! Bool {
            if logicalDeletedAt == nil {
                setPrimitiveValue(now, forKey: #keyPath(logicalDeletedAt))
                DebugLog.write(obj: "Set logicalDeletedAt")
            }
        }
        else {
            if logicalDeletedAt != nil {
                setPrimitiveValue(nil, forKey: #keyPath(logicalDeletedAt))
                DebugLog.write(obj: "Unset logicalDeletedAt")
            }
        }

        super.willSave()
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
