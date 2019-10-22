//
// TaskAddView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

class TaskAddViewModel: ObservableObject {
    @Published var publishedFlag = false
    var taskName = ""
    var limit = Date()
}

struct TaskAddView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: TaskAddViewModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $viewModel.taskName)
            DatePicker(
                selection: $viewModel.limit,
                displayedComponents: [.date, .hourAndMinute]
            ) {
                Text("Limit:")
            }
            HStack {
                Spacer()

                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                Button(action: {
                    self.viewModel.publishedFlag.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done")
                }
            }
        }
        .padding()
    }
}

struct TaskAddView_Previews: PreviewProvider {
    static var previews: some View {
        TaskAddView(viewModel: TaskAddViewModel())
    }
}
