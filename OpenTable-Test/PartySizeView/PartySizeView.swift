//
//  PartySizeView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct PartySizeView: View {
    @Binding var showingSheet: Bool
    let availablePartySizes = [1, 2, 3, 4, 5]
    let selectedTime: Date
    var onReservationComplete: (Reservation) -> Void
    
    var body: some View {
        VStack {
            ForEach(1...availablePartySizes.count, id: \.self) { index in
                NavigationLink {
                    GuestDetailsView(
                        showingSheet: $showingSheet,
                        selectedTime: selectedTime,
                        partySize: index) { reservation in
                            onReservationComplete(reservation)
                        }
                } label: {
                    PartySizeCellView(size: index)
                }
                .buttonStyle(.plain)
            }
            Spacer()
            Spacer()
        }
        .navigationTitle("Select a Party Size")
        .toolbar {
            CloseButton {
                showingSheet = false
            }
        }
    }
}

struct PartySizeView_Previews: PreviewProvider {
    static var previews: some View {
        PartySizeView(
            showingSheet: .constant(true),
            selectedTime: Date()) { _ in
                
            }
    }
}
