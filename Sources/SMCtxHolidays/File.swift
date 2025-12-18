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

    public static var current: SMCtxHolidayType {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())

        guard
            let year = components.year,
            let month = components.month,
            let day = components.day
        else {
            return .none
        }

        switch (month, day) {
        case (1, 1):
            return .newYearsDay
        case (2, 14):
            return .valentinesDay
        case (7, 4):
            return .fourthOfJuly
        case (10, 31):
            return .halloween
        case (12, 25):
            return .christmas
        case (11, _):
            return isThanksgiving(year: year, day: day) ? .thanksgiving : .none
        default:
            return .none
        }
    }

    public static var isHoliday: Bool {
        current != .none
    }

    public static var formatted: String {
        switch current {
        case .none:
            return "None"
        case .newYearsDay:
            return "New Year’s Day"
        case .valentinesDay:
            return "Valentine’s Day"
        case .fourthOfJuly:
            return "Fourth of July"
        case .halloween:
            return "Halloween"
        case .thanksgiving:
            return "Thanksgiving"
        case .christmas:
            return "Christmas"
        }
    }

    // MARK: - Thanksgiving Logic
    private static func isThanksgiving(year: Int, day: Int) -> Bool {
        let calendar = Calendar.current

        var components = DateComponents()
        components.year = year
        components.month = 11
        components.day = day

        guard let date = calendar.date(from: components) else {
            return false
        }

        let weekday = calendar.component(.weekday, from: date) // Thursday = 5
        let weekOfMonth = calendar.component(.weekOfMonth, from: date)

        return weekday == 5 && weekOfMonth == 4
    }
}

