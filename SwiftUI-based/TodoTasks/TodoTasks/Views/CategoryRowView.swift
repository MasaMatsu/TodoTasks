//
// CategoryRowView.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

class CategoryRowViewModel: ObservableObject {
    @Published var categotyName: String

    init(name: String) {
        self.categotyName = name
    }
}

struct CategoryRowView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State var isEditable = false
    @State var category: Category

    @ObservedObject var viewModel: CategoryRowViewModel

    var body: some View {
        HStack {
            if self.isEditable {
                TextField("Category name", text: $viewModel.categotyName)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            else {
                Text(self.category.name!)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onTapGesture(count: 2) {
            self.isEditable = true
        }
        .onReceive(viewModel.objectWillChange, perform: self.updateCategory)
    }

    func updateCategory() {
        let context = self.managedObjectContext.child()
        context.perform {
            let category = context.object(with: self.category.objectID) as! Category
            category.name = self.viewModel.categotyName
            do {
                try context.save()
            } catch {
                print("CategoryRowView: Raise error on updateCategory")
            }
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Dummy")
        // CategoryRowView()
    }
}
