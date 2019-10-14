//
// EntityBase.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Foundation
import CoreData

@objc(EntityBase)
public class EntityBase: NSManagedObject {
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var logicalDeletedAt: Date?
    @NSManaged public var isLogicalDeleted: Bool

    public override func willSave() {
        let now = Date()

        if isInserted {
            if createdAt == nil {
                setPrimitiveValue(now, forKey: #keyPath(createdAt))
            }
            if updatedAt == nil {
                setPrimitiveValue(now, forKey: #keyPath(updatedAt))
            }
        }
        else if isUpdated {
            setPrimitiveValue(now, forKey: #keyPath(updatedAt))
        }

        if primitiveValue(forKey: #keyPath(isLogicalDeleted)) as! Bool {
            if logicalDeletedAt == nil {
                setPrimitiveValue(now, forKey: #keyPath(logicalDeletedAt))
            }
        }
        else {
            if logicalDeletedAt != nil {
                setPrimitiveValue(nil, forKey: #keyPath(logicalDeletedAt))
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
    public func deletePhysically() {
        managedObjectContext?.delete(self)
    }
}
