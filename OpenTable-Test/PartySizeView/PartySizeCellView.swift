//
//  PartySizeCellView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct PartySizeCellView: View {
    let size: Int
    
    var body: some View {
        Text(String(size))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.purple, lineWidth: 2)
            )
            .padding([.leading, .trailing], 16)
    }
}

struct PartySizeCellView_Previews: PreviewProvider {
    static var previews: some View {
        PartySizeCellView(size: 5)
    }
}
