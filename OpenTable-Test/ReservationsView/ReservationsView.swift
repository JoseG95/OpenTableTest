//
//  ReservationsView.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import SwiftUI

struct ReservationsView: View {
    @State private var showingCreationFlow = false
    @State private var showingDetails = false
    @StateObject var viewModel = ReservationsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if viewModel.reservations.isEmpty {
                        Text("It seem's like you don't have any reservations yet, tap 'Create' button to start").padding()
                    }
                    
                    ForEach(0..<viewModel.reservations.count, id: \.self) { index in
                        let reservation = viewModel.reservations[index]
                        ReservationCellView(reservation: reservation)
                            .onTapGesture {
                                showingDetails.toggle()
                            }
                            .sheet(isPresented: $showingDetails) {
                                ReservationDetailView(reservation: reservation)
                            }
                    }
                    Spacer()
                }
                .navigationTitle("Reservations")
                .toolbar {
                    Button {
                        showingCreationFlow.toggle()
                    } label: {
                        Text("Create")
                    }.sheet(isPresented: $showingCreationFlow) {
                        let unavailableTimes = viewModel.getUnavailableTimes()
                        TimesView(
                            unavailableTimes: unavailableTimes,
                            showingSheet: $showingCreationFlow) { reservation in
                                viewModel.addReservation(reservation)
                            }
                    }
                }
            }
        }
    }
}

struct ReservationsView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationsView()
    }
}
