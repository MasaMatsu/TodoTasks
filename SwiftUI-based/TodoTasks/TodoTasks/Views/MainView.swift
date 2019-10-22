//
//  ContentView.swift
//  TodoTasks
//
//  Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        NavigationView {
            SidebarView()
            DetailView()
        }
    }

    // TODO: Separate logic from view
    static func categoriesFetchRequest() -> NSFetchRequest<Category> {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        request.predicate = NSPredicate(format: "isLogicalDeleted == false")
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Category.createdAt, ascending: true)
        ]
        return request
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
