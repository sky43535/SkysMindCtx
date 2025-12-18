//
//  File.swift
//  
//
//  Created by Owner on 12/17/25.
//

import UIKit

// MARK: - Battery Context
public struct SMCtxBattery {

    private static func enableMonitoring() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }

    /// Raw battery level (0.0 - 1.0), -1.0 if unavailable
    public static var level: Float {
        enableMonitoring()
        return UIDevice.current.batteryLevel
    }

    /// Battery percentage (0 - 100)
    public static var percentage: Int {
        let lvl = level
        guard lvl >= 0 else { return -1 }
        return Int(lvl * 100)
    }

    /// Battery is considered low at 20% or below
    public static var isLow: Bool {
        let lvl = level
        return lvl >= 0 && lvl <= 0.2
    }

    /// Device is charging or already full
    public static var isCharging: Bool {
        enableMonitoring()
        let state = UIDevice.current.batteryState
        return state == .charging || state == .full
    }

    /// Low Power Mode enabled
    public static var isLowPowerMode: Bool {
        ProcessInfo.processInfo.isLowPowerModeEnabled
    }
}

