//
// DetailView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // TODO: Coding
            HStack {
                Text("Category Name")
                .font(.title)

                Spacer()

                Text("3")
                .font(.title)
            }
            .padding(8)

            List {
                TaskRowView()
                TaskRowView()
                TaskRowView()
            }

            HStack {
                Button(action: {
                }) {
                    Image(nsImage: NSImage(named: NSImage.addTemplateName)!)
                }
                Button(action: {
                }) {
                    Image(nsImage: NSImage(named: NSImage.removeTemplateName)!)
                }
                Spacer()
            }
            .padding([.leading, .bottom], 10)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
