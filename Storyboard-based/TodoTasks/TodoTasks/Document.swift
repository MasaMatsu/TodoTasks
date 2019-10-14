//
// Document.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Cocoa

class Document: NSPersistentDocument {

    override init() {
        super.init()

        let ctx = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        ctx.persistentStoreCoordinator = managedObjectContext?.persistentStoreCoordinator
        managedObjectContext = ctx
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func configurePersistentStoreCoordinator(
        for url: URL,
        ofType fileType: String,
        modelConfiguration configuration: String?,
        storeOptions: [String : Any]? = nil
    ) throws {
        let options = [NSSQLitePragmasOption: ["journal_mode" : "DELETE"]]
        return try super.configurePersistentStoreCoordinator(
            for: url,
            ofType: fileType,
            modelConfiguration: configuration,
            storeOptions: options
        )
    }

    var childManagedObjectContext: NSManagedObjectContext? {
        if let ctx = managedObjectContext {
            let child = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            child.parent = ctx
            return child
        }
        return nil
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
        windowController.contentViewController?.representedObject = windowController.document
    }

}
