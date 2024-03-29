//
//  Document.swift
//  TodoTasks
//
//  Copyright © 2019 MasaMatsu. All rights reserved.
//

import Cocoa
import SwiftUI

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

    override func makeWindowControllers() {
        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let view =
            MainView()
            .frame(minWidth: 480, minHeight: 300)
            .environment(
                \.managedObjectContext,
                self.managedObjectContext!
            )

        // Create the window and set the content view.
        let window = NSWindow(
            contentRect: NSRect(
                x: 0, y: 0,
                width: 480, height: 300
            ),
            styleMask: [
                .titled,
                .closable,
                .miniaturizable,
                .resizable,
                .fullSizeContentView
            ],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.contentView = NSHostingView(rootView: view)
        let windowController = NSWindowController(window: window)
        self.addWindowController(windowController)
    }
}

extension NSManagedObjectContext {
    func child() -> NSManagedObjectContext {
        let child = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        child.parent = self
        return child
    }
}
