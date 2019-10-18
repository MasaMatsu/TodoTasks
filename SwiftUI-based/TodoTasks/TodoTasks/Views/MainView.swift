//
//  ContentView.swift
//  TodoTasks
//
//  Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct MainView: View {
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
