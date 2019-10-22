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

    @State private var taskName = ""
    @State private var limit = Date()

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
}

struct TaskInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInfoView()
    }
}
