//
// TaskInfoView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct TaskInfoView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @EnvironmentObject var task: Task

    @State var taskName: String
    @State var limit: Date

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $taskName)
            .font(.body)
            .textFieldStyle(PlainTextFieldStyle())

            Divider()

            DatePicker(
                selection: $limit,
                displayedComponents: [.date, .hourAndMinute]
            ) {
                Text("Limit:")
            }
        }
        .padding()
    }

    func editTask() {
        let context = self.managedObjectContext.child()
        context.perform {
            let changedTask = context.object(with: self.task.objectID) as! Task
            changedTask.name = self.$taskName.wrappedValue
            changedTask.limit = self.$limit.wrappedValue
            do {
                try context.save()
            } catch {
                print("TaskInfoView: Raise error on editTask")
            }
        }
    }
}

struct TaskInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoView(taskName: "Untitled", limit: Date())
    }
}
