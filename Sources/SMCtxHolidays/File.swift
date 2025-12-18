//
//  File.swift
//  
//
//  Created by Owner on 12/17/25.
//

import Foundation

// MARK: - Holiday Type
public enum SMCtxHolidayType: String {
    case none
    case newYearsDay
    case valentinesDay
    case fourthOfJuly
    case halloween
    case thanksgiving
    case christmas
}

// MARK: - Holidays Context
public struct SMCtxHolidays {

    // MARK: - Config (Optional)
    /// Number of days before/after a holiday to consider it active
    /// Default is 0 (only the exact day)
    public static var holidayRadiusDays: Int = 0

    // MARK: - Current Holiday
    public static var current: SMCtxHolidayType {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        for holiday in allHolidays {
            if let holidayDate = date(for: holiday),
               isWithinRadius(today, holidayDate) {
                return holiday
            }
        }

        return .none
    }

    public static var isHoliday: Bool {
        current != .none
    }

    public static var formatted: String {
        switch current {
        case .none: return "None"
        case .newYearsDay: return "New Year’s Day"
        case .valentinesDay: return "Valentine’s Day"
        case .fourthOfJuly: return "Fourth of July"
        case .halloween: return "Halloween"
        case .thanksgiving: return "Thanksgiving"
        case .christmas: return "Christmas"
        }
    }

    // MARK: - Holiday Dates
    private static let allHolidays: [SMCtxHolidayType] = [
        .newYearsDay,
        .valentinesDay,
        .fourthOfJuly,
        .halloween,
        .thanksgiving,
        .christmas
    ]

    private static func date(for holiday: SMCtxHolidayType) -> Date? {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())

        var components = DateComponents()
        components.year = year

        switch holiday {
        case .newYearsDay:
            components.month = 1; components.day = 1
        case .valentinesDay:
            components.month = 2; components.day = 14
        case .fourthOfJuly:
            components.month = 7; components.day = 4
        case .halloween:
            components.month = 10; components.day = 31
        case .christmas:
            components.month = 12; components.day = 25
        case .thanksgiving:
            return thanksgivingDate(year: year)
        case .none:
            return nil
        }

        return calendar.date(from: components)
    }

    // MARK: - Radius Logic
    private static func isWithinRadius(_ today: Date, _ holiday: Date) -> Bool {
        let calendar = Calendar.current
        let days = calendar.dateComponents([.day], from: holiday, to: today).day ?? 0
        return abs(days) <= holidayRadiusDays
    }

    // MARK: - Thanksgiving Logic
    private static func thanksgivingDate(year: Int) -> Date? {
        let calendar = Calendar.current

        var components = DateComponents()
        components.year = year
        components.month = 11
        components.weekday = 5 // Thursday
        components.weekdayOrdinal = 4 // 4th Thursday

        return calendar.date(from: components)
    }
}


