//
//  ContentView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct TimesView: View {
    let availableTimes = TimesProvider.getAllAvailableTimes()
    let unavailableTimes: [Date]
    @Binding var showingSheet: Bool
    var onReservationComplete: (Reservation) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(0..<availableTimes.count, id: \.self) { index in
                        NavigationLink {
                            PartySizeView(
                                showingSheet: $showingSheet,
                                selectedTime: availableTimes[index]) { reservation in
                                    onReservationComplete(reservation)
                                }
                        } label: {
                            let timeString = TimesProvider.getTimeString(availableTimes[index])
                            TimeCellView(
                                time: timeString,
                                isAvailable: !unavailableTimes.contains(availableTimes[index]))
                            .allowsHitTesting(!unavailableTimes.contains(availableTimes[index]))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .navigationTitle("Select a time")
            .toolbar {
                CloseButton {
                    showingSheet = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimesView(
            unavailableTimes: [],
            showingSheet: .constant(true)) { _ in }
    }
}
