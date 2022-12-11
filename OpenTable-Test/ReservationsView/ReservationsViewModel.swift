//
//  ReservationsViewModel.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 10/12/22.
//

import Foundation

class ReservationsViewModel: ObservableObject {
    @Published private(set) var reservations: [Reservation]
    
    init(reservations: [Reservation] = []) {
        self.reservations = reservations
    }
    
    func addReservation(_ reservation: Reservation) {
        reservations.append(reservation)
        reservations = reservations.sorted { $0.time < $1.time }
    }
    
    func getUnavailableTimes() -> [Date] {
        let allAvailableTimes = TimesProvider.getAllAvailableTimes()
        var unavailableTimes = [Date]()
        
        for reservation in reservations {
            guard let reservationIndex = allAvailableTimes.firstIndex(of: reservation.time) else { continue }
            
            unavailableTimes.append(allAvailableTimes[reservationIndex])
            
            for step in 1...3 {
                if reservationIndex + step <= allAvailableTimes.count - 1 {
                    unavailableTimes.append(allAvailableTimes[reservationIndex + step])
                }
                
                if reservationIndex - step >= 0 {
                    unavailableTimes.append(allAvailableTimes[reservationIndex - step])
                }
            }
        }
        
        return unavailableTimes
    }
}
