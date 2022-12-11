//
//  TimeCellView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct TimeCellView: View {
    let time: String
    let isAvailable: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text(time)
                .padding([.vertical], 1)
            Text(isAvailable ? "Available" : "Not Available")
                .padding([.vertical], 1)
        }
        .foregroundColor(isAvailable ? .black : .gray)
        .padding()
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isAvailable ? Color.purple : Color.gray, lineWidth: 2)
        )
        .background(Color.white)
        .padding([.horizontal], 16.0)
        .padding([.top], 8.0)
    }
}

struct TimeCellView_Previews: PreviewProvider {
    static var previews: some View {
        TimeCellView(
            time: "3:00 PM",
            isAvailable: true)
    }
}
