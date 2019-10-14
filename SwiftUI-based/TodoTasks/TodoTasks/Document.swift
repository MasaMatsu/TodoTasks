//
//  Document.swift
//  
//  
//  Copyright © 2019 MasaMatsu. All rights reserved.
//

import Cocoa
import SwiftUI

class Document: NSPersistentDocument {
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let view =
            MainView()
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
