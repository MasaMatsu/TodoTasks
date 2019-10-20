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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
