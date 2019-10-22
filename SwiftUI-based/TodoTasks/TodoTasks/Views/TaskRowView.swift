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

    @ObservedObject var viewModel = TaskInfoViewModel()

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
            TaskInfoView(viewModel: self.viewModel)
            .frame(width: 300)
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
