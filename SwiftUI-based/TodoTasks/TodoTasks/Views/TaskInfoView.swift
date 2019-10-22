//
// TaskInfoView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import Combine
import SwiftUI

class TaskInfoViewModel: ObservableObject {
    @Published var taskName = ""
    @Published var limit = Date()
}

struct TaskInfoView: View {
    @ObservedObject var viewModel: TaskInfoViewModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Title", text: $viewModel.taskName)
            .font(.body)
            .textFieldStyle(PlainTextFieldStyle())

            Divider()

            DatePicker(
                selection: $viewModel.limit,
                displayedComponents: [.date, .hourAndMinute]
            ) {
                Text("Limit:")
            }
        }
        .padding()
    }
}

struct TaskInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoView(viewModel: TaskInfoViewModel())
    }
}
