//
//  CloseButton.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 10/12/22.
//

import SwiftUI

struct CloseButton: View {
    let onTapped: () -> Void
    var body: some View {
        Button {
            onTapped()
        } label: {
            Text("Close")
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton() {}
    }
}
