//
//  File.swift
//  
//
//  Created by Owner on 12/17/25.
//

import Foundation

// MARK: - Weekday / Weekend Type
public enum SMCtxWeekType: String {
    case weekday
    case weekend
}

// MARK: - Weekday / Weekend Context
public struct SMCtxWeekdayWeekend {

    /// Raw weekday number (1 = Sunday, 7 = Saturday)
    public static var weekdayNumber: Int {
        Calendar.current.component(.weekday, from: Date())
    }

    /// Logic-safe current week type
    public static var current: SMCtxWeekType {
        switch weekdayNumber {
        case 1, 7:
            return .weekend
        default:
            return .weekday
        }
    }

    /// Convenience flag
    public static var isWeekend: Bool {
        current == .weekend
    }

    /// Convenience flag
    public static var isWeekday: Bool {
        current == .weekday
    }

    /// Human-readable value for UI/logging
    public static var formatted: String {
        switch current {
        case .weekday:
            return "Weekday"
        case .weekend:
            return "Weekend"
        }
    }
}
