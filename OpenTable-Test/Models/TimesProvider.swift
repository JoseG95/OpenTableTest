//
//  TimesProvider.swift
//  OpenTable-Test
//
//  Created by Jose Gutierrez on 09/12/22.
//

import Foundation

struct TimesProvider {
    
    static func getAllAvailableTimes() -> [Date] {
        var dates = [Date]()
        
        let currentDateComponents = Calendar.current.dateComponents([.day], from: Date())
        
        guard let startDate = DateComponents(calendar: .current,
                                             day: currentDateComponents.day,
                                             hour: 15).date,
              let endDate = DateComponents(calendar: .current,
                                           day: currentDateComponents.day,
                                           hour: 22).date else {
            return []
        }
        
        let interval: TimeInterval = 15 * 60
        
        for date in stride(from: startDate, to: endDate, by: interval) {
            dates.append(date)
        }
        
        dates.append(endDate)
        
        return dates
    }
    
    static func getTimeString(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        
        return formatter.string(from: time)
    }
}
