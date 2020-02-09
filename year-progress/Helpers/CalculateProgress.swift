//
//  CalculateProgress.swift
//  year-progress
//
//  Created by André on 09/02/20.
//  Copyright © 2020 André. All rights reserved.
//

import Foundation


enum acceptablePeriods {
    case day
    case month
    case year
}

func lastDayOfMonth(ofMonth m: Int, year y: Int) -> Int {
    let cal = Calendar.current
    var comps = DateComponents(calendar: cal, year: y, month: m)
    comps.setValue(m + 1, for: .month)
    comps.setValue(0, for: .day)
    let date = cal.date(from: comps)!
    return cal.component(.day, from: date)
}

func numberOfDaysInCurrentYear() -> Int {
    let calendar = Calendar.init(identifier: .gregorian)
    let interval = calendar.dateInterval(of: .year, for: Date.init())!
    let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
    return days
}

func calculateProgress(period: acceptablePeriods) -> Double {
    let date = Date()
    let calendar = Calendar.current
    
    let year = calendar.component(.year, from: date)
    let daysInYear = numberOfDaysInCurrentYear()
    
    let month = calendar.component(.month, from: date)
    
    let day = calendar.component(.day, from: date)
    let dayInRelationToYear = calendar.ordinality(of: .day, in: .year, for: date) ?? 1
    
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let lastDayMonth = lastDayOfMonth(ofMonth: month, year: year)
    

    switch period {
    case .day:
        return (Double(hour * 60 + minute) * 100 / (24*60) )
    case .month:
        return(Double((day * 100)/lastDayMonth))
    case .year:
        return(Double((dayInRelationToYear * 100)/daysInYear))
    }
}
