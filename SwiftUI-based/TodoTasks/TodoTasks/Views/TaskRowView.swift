//
// TaskRowView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct TaskRowView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

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

            Button(action: {
                self.viewModel.taskName = self.task.name!
                self.viewModel.limit = self.task.limit!
                self.isPresentedPopover = true
            }) {
                Image(nsImage: NSImage(named: NSImage.touchBarGetInfoTemplateName)!)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .popover(isPresented: $isPresentedPopover, arrowEdge: .trailing) {
            TaskInfoView(viewModel: self.viewModel)
            .frame(width: 300)
        }
        .onReceive(viewModel.objectWillChange, perform: self.updateTask)
    }

    func updateTask() {
        let context = self.managedObjectContext.child()
        context.perform {
            let task = context.object(with: self.task.objectID) as! Task
            task.name = self.viewModel.taskName
            task.limit = self.viewModel.limit

            do {
                try context.save()
            }
            catch {
                print("TaskRowView: Raise error on onReceive")
            }
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
