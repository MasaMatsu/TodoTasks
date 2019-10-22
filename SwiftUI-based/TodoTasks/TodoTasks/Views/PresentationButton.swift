//
// PresentationButton.swift
// TodoTasks
//
// Copyright © 2019 MasaMatsu. All rights reserved.
//

import SwiftUI

struct PresentationButton: View {
    @Binding var isPresented: Bool

    let imageName: NSImage.Name

    var body: some View {
        Button(action: {
            self.isPresented = true
        }) {
            Image(nsImage: NSImage(named: imageName)!)
        }
    }
}

struct PresentationButton_Previews: PreviewProvider {
    static var previews: some View {
        PresentationButton(
            isPresented: .constant(false),
            imageName: NSImage.addTemplateName
        )
    }
}
