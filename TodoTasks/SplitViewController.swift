//
// ViewController.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Maximum Sidebar width.
        splitViewItems[0].maximumThickness = 300
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

