//
// TaskRowView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct TaskRowView: View {
    @EnvironmentObject var task: Task

    @State var isPresentedPopover = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.task.name!)
                Text("\(self.task.limit!)") // TODO: Set DateFormatter
            }

            Spacer()

            Button(action: {
                self.isPresentedPopover = true
            }) {
                Image(nsImage: NSImage(named: NSImage.touchBarGetInfoTemplateName)!)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .popover(isPresented: $isPresentedPopover, arrowEdge: .trailing) {
            TaskInfoView()
            .frame(width: 300)
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
