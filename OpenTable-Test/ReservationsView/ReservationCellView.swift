//
//  ReservationCellView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 10/12/22.
//

import SwiftUI

struct ReservationCellView: View {
    let reservation: Reservation
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reservation.name)
                Text(TimesProvider.getTimeString(reservation.time))
            }
            .padding()
            
            Spacer()
            let partySize = reservation.partySize
            Text(partySize > 1 ? "\(reservation.partySize) people" : "\(reservation.partySize) person")
                .padding()
        }
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.purple, lineWidth: 2)
        )
        .padding([.horizontal], 16)
    }
}

struct ReservationCellView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCellView(reservation: Reservation(
            time: Date(),
            name: "José",
            partySize: 5,
            phoneNumber: "5513684732",
            visitNotes: "I would like to reserve a table at your restaurant please"))
    }
}
