//
// SidebarView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
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
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
