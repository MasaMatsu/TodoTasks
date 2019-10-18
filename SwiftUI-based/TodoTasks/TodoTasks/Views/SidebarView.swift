//
// SidebarView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            List {
                // TODO: Coding
                NavigationLink(destination: DetailView()) {
                    Text("Category Name1")
                }
                NavigationLink(destination: DetailView()) {
                    Text("Category Name2")
                }
                NavigationLink(destination: DetailView()) {
                    Text("Category Name3")
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
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
