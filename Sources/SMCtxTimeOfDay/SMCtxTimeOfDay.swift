//
//  File.swift
//  
//
//  Created by Owner on 12/17/25.
//

import Foundation

// MARK: - Time Of Day Type
public enum SMCtxTimeOfDayType: String {
    case morning
    case afternoon
    case evening
    case night
}

// MARK: - Time Of Day Context
public struct SMCtxTimeOfDay {

    /// Returns the current time-of-day bucket
    public static var current: SMCtxTimeOfDayType {
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<12:
            return .morning
        case 12..<17:
            return .afternoon
        case 17..<21:
            return .evening
        default:
            return .night
        }
    }

    /// Human-readable string (for UI / logging)
    public static var formatted: String {
        current.rawValue.capitalized
    }
}

