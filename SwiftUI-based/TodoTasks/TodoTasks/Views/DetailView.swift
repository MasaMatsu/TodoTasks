//
// DetailView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @EnvironmentObject var category: Category

    @State private var isPresentedSheet = false

    @ObservedObject(initialValue: TaskAddViewModel()) var viewModel: TaskAddViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.category.name!)
                .font(.title)

                Spacer()

                Text("\(self.category.tasks!.count)")
                .font(.title)
            }
            .padding(8)

            List(
                self.category.tasks?
                .sortedArray(using: [
                    NSSortDescriptor(keyPath: \Task.createdAt, ascending: true)
                ]) as! [Task]
            ) { task in
                TaskRowView()
                .environmentObject(task)
            }

            HStack {
                Button(action: {
                    self.isPresentedSheet = true
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
            .sheet(isPresented: $isPresentedSheet) {
                TaskAddView(viewModel: self.viewModel)
                .frame(width: 300)
            }
        }
        .onReceive(viewModel.objectWillChange, perform: self.addTask)
    }

    func addTask() {
        let context = self.managedObjectContext.child()
        context.perform {
            let category = context.object(with: self.category.objectID) as! Category

            let task = Task(context: context)
            task.name = self.viewModel.taskName
            task.limit = self.viewModel.limit
            category.addToTasks(task)

            do {
                try context.save()
            } catch {
                print("DetailView: Raise error on addTask")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
