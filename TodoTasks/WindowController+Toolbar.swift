//
// WindowController+Toolbar.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Cocoa

extension WindowController: NSToolbarDelegate {
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [
            .toggleSidebar,
        ]
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [
            .toggleSidebar,
            .space,
            .flexibleSpace,
            .separator,
        ]
    }
}
