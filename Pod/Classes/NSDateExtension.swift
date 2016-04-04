//
//  DateExtension.swift
//  SwiftExtension
//
//  Created by Mitul Golakiya on 01/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation

extension NSDate {
    
    //  Get Week day from date
    public var weekDay:Int {
        return NSCalendar.currentCalendar().component(.Weekday, fromDate: self)
    }
    
    //  Get Week index of month from date
    public var weekOfMonth : Int {
        return NSCalendar.currentCalendar().component(.WeekOfMonth, fromDate: self)
    }
    
    //  Get Week day name from date
    public var weekDayName : String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.stringFromDate(self)
    }
    
    
    //  Get Month name from date
    public var monthName : String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.stringFromDate(self)
    }
    
    //  Get Month index from date
    public var month: Int {
        return NSCalendar.currentCalendar().component(.Month, fromDate: self)
    }
    
    //  Get Day index from date
    public var day: Int {
        return NSCalendar.currentCalendar().component(.Day, fromDate: self)
    }
    
    //  Get Year index from date
    public var year: Int {
        return NSCalendar.currentCalendar().component(.Year, fromDate: self)
    }
    
    //  Get Hour and Minute from date
    public func getHourAndMinute() -> (hour : Int, minute : Int) {
        let calendar = NSCalendar.currentCalendar()
        let comp = calendar.components([.Hour, .Minute], fromDate: self)
        return (comp.hour, comp.minute)
    }
    
    //  Get Total count of weeks in month from date
    public func weeksInMonth() -> Int?
    {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.firstWeekday = 2 // 2 == Monday
        
        // First monday in month:
        let comps = NSDateComponents()
        comps.month = self.month
        comps.year = self.year
        comps.weekday = calendar.firstWeekday
        comps.weekdayOrdinal = 1
        guard let first = calendar.dateFromComponents(comps)  else {
            return nil
        }
        
        // Last monday in month:
        comps.weekdayOrdinal = -1
        guard let last = calendar.dateFromComponents(comps)  else {
            return nil
        }
        
        // Difference in weeks:
        let weeks = calendar.components(.WeekOfMonth, fromDate: first, toDate: last, options: [])
        return weeks.weekOfMonth + 1
    }
    
    //  Get Total count of week days in month from date
    public func weekDaysInMonth() -> Int?
    {
        guard 1...12 ~= month else { return nil }
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let components = NSDateComponents()
        components.weekday =  self.weekDay
        components.weekdayOrdinal = 1
        components.month = self.month
        components.year = self.year
        
        if let date = calendar.dateFromComponents(components)  {
            let firstDay = calendar.component(.Day, fromDate: date)
            let days = calendar.rangeOfUnit(.Day, inUnit:.Month, forDate:date).length
            return (days - firstDay) / 7 + 1
        }
        return nil
    }
    
    //  Get Total count of days in month from date
    public func daysInMonth() -> Int? {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        return calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: self).length
    }
    
    //  Get Time in AM / PM format
    public func getTime() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.stringFromDate(self)
    }
    
    //  Get Time short (i.e 12 Mar) format
    public func getTimeInShortFormat() -> String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.stringFromDate(self)
    }
    
    //  Get Time short (i.e 12 Mar, 2016) format
    public func getTimeInFullFormat() -> String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd MMM, yyyy"
        return formatter.stringFromDate(self)
    }
    
    //  Get Time standard (i.e 2016-03-12) format
    public func formateBirthDate() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.stringFromDate(self)
    }
    
    //  Check date is after date
    public func afterDate(date : NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedAscending
    }
    
    //  Check date is before date
    public func beforDate(date : NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedDescending
    }
    
    //  Check date is equal date
    public func equalDate(date : NSDate) -> Bool {
        return self.isEqualToDate(date)
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