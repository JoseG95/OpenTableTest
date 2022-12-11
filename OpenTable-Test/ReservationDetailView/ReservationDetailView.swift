//
//  ReservationDetailView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 10/12/22.
//

import SwiftUI

struct ReservationDetailView: View {
    @Environment(\.dismiss) var dismiss
    let reservation: Reservation
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(reservation.name)
                        .font(.system(size: 24, weight: .bold))

                    HStack {
                        Text("Party size:")
                        Text("\(reservation.partySize)")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 20))

                    HStack {
                        Text("Time: ")
                        Text("\(TimesProvider.getTimeString(reservation.time))")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 20))
                }
                .padding([.vertical], 12)

                VStack(alignment: .leading) {
                    Text("Phone")
                        .fontWeight(.bold)
                    Text(reservation.phoneNumber ?? "")
                }
                .padding([.vertical], 12)


                VStack(alignment: .leading) {
                    Text("Visit notes")
                        .fontWeight(.bold)
                    Text(reservation.visitNotes ?? "")
                }
                .padding([.vertical], 12)

                Spacer()
            }
            .navigationTitle("Details")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                }
            }
        }
    }
}

struct ReservationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationDetailView(reservation: Reservation(
            time: Date(),
            name: "José",
            partySize: 5,
            phoneNumber: "5513684732",
            visitNotes: "I would like to reserve a table at your restaurant please"))
    }
}
