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

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.task.name!)
                Text("\(self.task.limit!, formatter: self.dateFormatter)")
            }
            .contextMenu {
                Button(action: self.removeTask) {
                    Text("Remove")
                }
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

    func removeTask() {
        let context = self.managedObjectContext.child()
        context.perform {
            let task = context.object(with: self.task.objectID) as! Task
            task.deletePhysically()
            do {
                try context.save()
            } catch {
                print("DetailView: Raise error on removeTask")
            }
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView()
    }
}
