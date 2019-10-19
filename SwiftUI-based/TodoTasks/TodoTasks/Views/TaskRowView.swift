//
// TaskRowView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct TaskRowView: View {
    var body: some View {
        HStack {
            // TODO: Coding
            VStack(alignment: .leading) {
                Text("Task Name")
                Text("2019/10/20 12:00")
            }

            Spacer()

            Button(action: {
            }) {
                Image(nsImage: NSImage(named: NSImage.touchBarGetInfoTemplateName)!)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
