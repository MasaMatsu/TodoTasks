//
//  ContentView.swift
//  TodoTasks
//
//  Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(fetchRequest: categoriesFetchRequest()) var categories: FetchedResults<Category>

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(categories) { category in
                    NavigationLink(destination: DetailView()) {
                        Text(category.name!)
                    }
                }

                Spacer()

                Button(action: {
                }) {
                    Image(nsImage: NSImage(named: NSImage.addTemplateName)!)
                    Text("Add Category")
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding([.leading, .bottom], 10)
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 150, maxWidth: 300)

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
