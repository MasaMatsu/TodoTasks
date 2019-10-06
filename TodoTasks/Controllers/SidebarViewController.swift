//
// SidebarViewController.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Cocoa

class SidebarViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    @IBAction func ButtonToAddCategory(_ sender: Any) {
        tmpSaveTest()
    }

    private func tmpSaveTest() {
        let context = (representedObject as! Document).managedObjectContext!
        let category = TodoCategory(context: context)
        category.categoryName = "Test Category"
        do {
            try context.save()
        }
        catch {
            let alert = NSAlert(error: error)
            alert.alertStyle = .critical
            alert.messageText = "save was faild."
            alert.runModal()
        }
    }
}
