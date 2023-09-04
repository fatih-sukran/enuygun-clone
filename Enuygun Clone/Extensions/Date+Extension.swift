//
//  Date+Extension.swift
//  Enuygun Clone
//
//  Created by Fatih Şükran on 22.08.2023.
//

import Foundation

extension Date {
    /// Returns a specific component value from the date.
    ///
    /// - Parameter component: The calendar component to extract (e.g., .year, .month, .day, etc.).
    /// - Returns: The extracted component value.
    ///
    /// - Example:
    ///     ```
    ///     let date = Date(year: 2023, month: 8, day: 5)
    ///     let dayComponent = date.get(.day) // Returns 5
    ///     ```
    func get(_ component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
    
    /// The day value of the date.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let day = currentDate.day // Returns 30
    ///     ```
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    
    /// The month value of the date.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let month = currentDate.month // Returns 8
    ///     ```
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// The year value of the date.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let month = currentDate.month // Returns 2023
    ///     ```
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// Returns the abbreviated day name (e.g., "Tue") for the date.
    ///
    /// - Returns: The abbreviated day name.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let abbreviatedDay = currentDate.getDayName() // Returns "Wed"
    ///     ```
    func getDayName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
    
    /// Returns the full day name (e.g., "Tuesday") for the date.
    ///
    /// - Returns: The full day name.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let fullDay = currentDate.getFullDayName() // Returns "Wednesday"
    ///     ```
    func getFullDayName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    /// Returns the abbreviated month name (e.g., "Jan") for the date.
    ///
    /// - Returns: The abbreviated month name.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let abbreviatedMonth = currentDate.getMonthName() // Returns "Aug"
    ///     ```
    func getMonthName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: self)
    }
    
    /// Returns the full month name (e.g., "January") for the date.
    ///
    /// - Returns: The full month name.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let fullMonth = currentDate.getFullMonthName() // Returns "August"
    ///     ```
    func getFullMonthName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }
}

/// A set of extensions for providing enhanced functionality to the `Date` class.
extension Date {
    /// Returns the start of the day for the date.
    ///
    /// - Returns: A new `Date` representing the start of the day.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30 12:00:00
    ///     let startOfDay = currentDate.startOfDay() // Returns 2023-08-30 00:00:00
    ///     ```
    func startOfDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    /// Returns the end of the day for the date.
    ///
    /// - Returns: A new `Date` representing the end of the day.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30 12:00:00
    ///     let endOfDay = currentDate.endOfDay() // Returns 2023-08-30 23:59:59
    ///     ```
    func endOfDay() -> Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay()) ?? self
    }
    
    /// Returns the first day of the month for the date.
    ///
    /// - Returns: A new `Date` representing the first day of the month.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let firstDay = currentDate.firstDayOfMonth() // Returns 2023-08-01
    ///     ```
    func firstDayOfMonth() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)!
    }}

/// A set of extensions for manipulating dates by adding or subtracting days and months.
extension Date {
    /// Returns a new date by adding days and/or months to the current date.
    ///
    /// - Parameters:
    ///   - days: The number of days to add. Default is 0.
    ///   - months: The number of months to add. Default is 0.
    /// - Returns: A new `Date` after adding the specified days and months.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let newDate = currentDate.adding(days: 7, months: 1) // Returns a new date 2023-09-06 (30 + 7 days and 1 month)
    ///     ```
    func adding(days: Int = 0, months: Int = 0) -> Date {
        var date = self
        date =  Calendar.current.date(byAdding: .day, value: days, to: date) ?? self
        date = Calendar.current.date(byAdding: .month, value: months, to: date) ?? date
        
        return date
    }
    
    /// Returns a new date by subtracting days from the current date.
    ///
    /// - Parameter days: The number of days to subtract.
    /// - Returns: A new `Date` after subtracting the specified days.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let newDate = currentDate.subtracting(days: 5) // Returns a new date 2023-08-25 (30 - 5 days)
    ///     ```
    func subtracting(days: Int) -> Date {
        return adding(days: -days)
    }
}


/// A set of extensions for checking various conditions and getting date arrays.
extension Date {
    /// Checks if the date is in the future.
    ///
    /// - Returns: `true` if the date is in the future, otherwise `false`.
    ///
    /// - Example:
    ///     ```
    ///     let futureDate = Date(year: 2024, month: 1, day: 1)
    ///     let isFuture = futureDate.isFuture() // Returns true
    ///     ```
    func isFuture() -> Bool {
        return self > Date()
    }
    
    /// Checks if the date is today.
    ///
    /// - Returns: `true` if the date is today, otherwise `false`.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let isToday = currentDate.isToday() // Returns true
    ///     ```
    func isToday() -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    /// Checks if the date is in the past.
    ///
    /// - Returns: `true` if the date is in the past, otherwise `false`.
    ///
    /// - Example:
    ///     ```
    ///     let pastDate = Date(year: 2020, month: 3, day: 15)
    ///     let isPast = pastDate.isPast() // Returns true
    ///     ```
    func isPast() -> Bool {
        return isPast(of: Date.now)
    }
    
    func isPast(of date: Date) -> Bool {
        return self < date
    }
    
    /// Checks if the date is on a weekend.
    ///
    /// - Returns: `true` if the date falls on a weekend, otherwise `false`.
    ///
    /// - Example:
    ///     ```
    ///     let weekendDate = Date(year: 2023, month: 9, day: 2) // Saturday
    ///     let isWeekend = weekendDate.isWeekend() // Returns true
    ///     ```
    func isWeekend() -> Bool {
        let calendar = Calendar.current
        return calendar.isDateInWeekend(self)
    }
    
    /// Checks if the current date is equal to another date based on specified components.
    ///
    /// - Parameters:
    ///   - date: The date to compare against.
    ///   - components: The set of calendar components to consider for comparison (e.g., [.year, .month, .day]).
    /// - Returns: `true` if the dates are equal for the specified components, otherwise `false`.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30 12:34:56
    ///     let otherDate = Date(year: 2023, month: 8, day: 30, hour: 18, minute: 45)
    ///     let isEqual = currentDate.isEqual(to: otherDate, components: [.year, .month, .day]) // Returns true
    ///     ```
    func isEqual(to date: Date, components: Set<Calendar.Component>) -> Bool {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents(components, from: self)
        let otherDateComponents = calendar.dateComponents(components, from: date)
        
        return dateComponents == otherDateComponents
    }
    
    func getDayOfWeek() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        let dayOfWeek =  calendar.component(.weekday, from: self)
        return (dayOfWeek + 5) % 7
    }
}

extension Date {
    
    /// Returns a new date with the time portion set to midnight (00:00:00).
    ///
    /// - Returns: A new `Date` with the time portion set to midnight.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30 12:34:56
    ///     let dateWithoutTime = currentDate.dateWithoutTime() // Returns 2023-08-30 00:00:00
    ///     ```
    func dateWithoutTime() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: components) ?? self
    }
    
    /// Returns an array of dates representing all days of the current month.
    ///
    /// - Returns: An array of `Date` objects.
    ///
    /// - Example:
    ///     ```
    ///     let currentDate = Date() // e.g., 2023-08-30
    ///     let allMonthDays = currentDate.getAllMonthDays() // Returns an array of all days in the month of August 2023
    ///     ```
    func getAllMonthDays() -> [Date] {
        var dates: [Date] = []
        
        var date = self.firstDayOfMonth()
        let month: Int = self.month
        
        while true {
            dates.append(date)
            date = date.adding(days: 1)
            
            if date.month != month {
                break
            }
        }
        
        return dates
    }
}
