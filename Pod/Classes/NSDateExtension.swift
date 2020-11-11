//
//  DateExtension.swift
//  SwiftExtension
//
//  Created by Mitul Golakiya on 01/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation

extension Date {
    
    //  Get Week day from date
    public var weekDay:Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    //  Get Week index of month from date
    public var weekOfMonth : Int {
        return Calendar.current.component(.weekOfMonth, from: self)
    }
    
    //  Get Week day name from date
    public var weekDayName : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    
    //  Get Month name from date
    public var monthName : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }
    
    //  Get Month index from date
    public var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    //  Get Day index from date
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    //  Get Year index from date
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    //  Get Hour and Minute from date
    public func getHourAndMinute() -> (hour : Int, minute : Int) {
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: self)
        return (comp.hour!, comp.minute!)
    }
    
    //  Get Total count of weeks in month from date
    public func weeksInMonth() -> Int?
    {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2 // 2 == Monday
        
        // First monday in month:
        var comps = DateComponents()
        comps.month = self.month
        comps.year = self.year
        comps.weekday = calendar.firstWeekday
        comps.weekdayOrdinal = 1
        guard let first = calendar.date(from: comps)  else {
            return nil
        }
        
        // Last monday in month:
        comps.weekdayOrdinal = -1
        guard let last = calendar.date(from: comps)  else {
            return nil
        }
        
        // Difference in weeks:
        let weeks = calendar.dateComponents([.weekOfMonth], from: first, to: last)
        return weeks.weekOfMonth! + 1
    }
    
    //  Get Total count of week days in month from date
    public func weekDaysInMonth() -> Int?
    {
        guard 1...12 ~= month else { return nil }
        
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.weekday =  self.weekDay
        components.weekdayOrdinal = 1
        components.month = self.month
        components.year = self.year
        
        if let date = calendar.date(from: components)  {
            let firstDay = calendar.component(.day, from: date)
            let days = calendar.range(of: .day, in: .month, for: date)?.count
            return (days! - firstDay) / 7 + 1
        }
        return nil
    }
    
    //  Get Total count of days in month from date
    public func daysInMonth() -> Int? {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.range(of: .day, in: .month, for: self)?.count
    }
    
    //  Get Time in AM / PM format
    public func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
    //  Get Time short (i.e 12 Mar) format
    public func getTimeInShortFormat() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: self)
    }
    
    //  Get Time short (i.e 12 Mar, 2016) format
    public func getTimeInFullFormat() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        return formatter.string(from: self)
    }
    
    //  Get Time standard (i.e 2016-03-12) format
    public func formateBirthDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    //  Get Time standard (i.e 2016-03-12 12:12:12) format
    public func getFormatDateAndTime() -> String {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormate.string(from: self)
    }
    
    //  Check date is after date
    public func afterDate(date : Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedAscending
    }
    
    //  Check date is before date
    public func beforDate(date : Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedDescending
    }
    
    //  Check date is equal date
    public func equalDate(date : Date) -> Bool {
        return self == date
    }
    
    //  Get days difference between dates
    public func daysInBetweenDate(date: NSDate) -> Double {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference/86400)
        return difference
    }
    
    //  Get hours difference between dates
    public func hoursInBetweenDate(date: NSDate) -> Double {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference/3600)
        return difference
    }
    
    //  Get minutes difference between dates
    public func minutesInBetweenDate(date: NSDate) -> Double {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference/60)
        return difference
    }
    
    //  Get seconds difference between dates
    public func secondsInBetweenDate(date: NSDate) -> Double {
        var difference = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        difference = fabs(difference)
        return difference
    }
    
    //  Get time difference between dates
    public func getDifferenceBetweenDates() -> String {
        let interval = self.timeIntervalSinceNow
        let year : Int = Int(interval) / 31536000
        var finalString = "'"
        if year >= 1 {
            if year == 1 {
                finalString += "1 year : "
            }
            else {
                finalString += "\(year) years : "
            }
        }
        let remainAfterYear = Int( interval) % 31536000
        let month = remainAfterYear / 2592000
        if month >= 1 {
            if month == 1 {
                finalString += "1 month : "
            }
            else {
                finalString += "\(month) months : "
            }
        }
        let remainAfterMonth =  remainAfterYear % 2592000
        let day = remainAfterMonth / 86400
        if day >= 1 {
            if day == 1 {
                finalString += "1 day : "
            }
            else {
                finalString += "\(day) days : "
            }
        }
        let remainAfterDay =  remainAfterMonth % 86400
        let hour = remainAfterDay / 3600
        if hour >= 1 {
            finalString += "\(hour)h : "
        }
        let remainAfterHour =  remainAfterDay % 3600
        let minute = remainAfterHour / 60
        if minute >= 1 {
            finalString += "\(minute)m : "
        }
        
        return finalString
    }
}
