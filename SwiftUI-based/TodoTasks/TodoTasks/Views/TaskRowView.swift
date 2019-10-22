//
// TaskRowView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct TaskRowView: View {
    @EnvironmentObject var task: Task

    @State private var isPresentedPopover = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.task.name!)
                Text("\(self.task.limit!)") // TODO: Set DateFormatter
            }

            Spacer()

            PresentationButton(
                isPresented: $isPresentedPopover,
                imageName: NSImage.touchBarGetInfoTemplateName
            )
            .buttonStyle(BorderlessButtonStyle())
        }
        .popover(isPresented: $isPresentedPopover, arrowEdge: .trailing) {
            TaskInfoView(taskName: self.task.name!, limit: self.task.limit!)
            .frame(width: 300)
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
