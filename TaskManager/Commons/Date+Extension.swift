//
//  Date+Extension.swift
//  TaskManager
//
//  Created by Antonio Chavez Saucedo on 05/01/23.
//

import SwiftUI

extension Date{
    func toString(_ format: String)->String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension Calendar{
    // Return 24 Hours in a day
    var hours: [Date]{
        let startOfDay = self.startOfDay(for: Date())
        var hours: [Date] = []
        for index in  0..<24{
            if let date = self.date(byAdding: .hour, value: index, to: startOfDay){
                hours.append(date)
            }
        }
        return hours
    }
    
    // Return Current Week in Array Format
    var currentWeek: [WeekDay] {
        guard let firstWeekDay = self.dateInterval(of: .weekOfMonth, for: Date())?.start else {return []}
        var week: [WeekDay] = []
        for index in 0..<7{
            if let day = self.date(byAdding: .day, value: index, to: firstWeekDay){
                let weekDaySymbol: String = day.toString("EEEE")
                let isToday = self.isDateInToday(day)
                week.append(.init(string: weekDaySymbol, date: day, isToday: isToday))
            }
        }
        return week
    }
    
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var string: String
        var date: Date
        var isToday: Bool = false
    }
}
