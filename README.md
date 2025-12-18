# SkysMindCtx

SkysMindCtx is a **modular iOS SDK** that provides contextual information about the device, date, and environment. It’s designed so developers can **import only the features they need** and easily integrate context-aware behaviors in their apps.

## Features

Each feature is its own **independent module**:

| Module             | Import Name             | Description                                                                 |
|-------------------|------------------------|-----------------------------------------------------------------------------|
| Time of Day        | `SMCtxTimeOfDay`       | Provides a vague “time of day” context (morning, afternoon, evening, night)|
| Weekday / Weekend  | `SMCtxWeekdayWeekend`  | Determines if today is a weekday or weekend, provides convenience booleans |
| Holidays           | `SMCtxHolidays`        | Detects major US holidays (New Year’s, Valentine’s, 4th of July, Halloween, Thanksgiving, Christmas)|
| Battery            | `SMCtxBattery`         | Provides battery level, charging state, and low power mode information     |

## Installation via Swift Package Manager

1. Go to the repository on GitHub: https://github.com/sky43535/SkysMindCtx.git  
2. **Fork the repository** to your own GitHub account.  
3. In Xcode, go to **File → Add Packages...**  
4. Enter the **URL of your forked repository**.  
5. Choose the **version or branch** you want.  
6. **Select the modules** you want to include in your app:  
   - Only import the features you need to reduce build size.  
   - Available modules:  
     - `SMCtxTimeOfDay`  
     - `SMCtxWeekdayWeekend`  
     - `SMCtxHolidays`  
     - `SMCtxBattery`


## Module Usage & Exposed Values

### Time of Day (`SMCtxTimeOfDay`)
**Import**
```swift
import SMCtxTimeOfDay
```
| Property  | Type               | Description                                          |
| --------- | ------------------ | ---------------------------------------------------- |
| current   | SMCtxTimeOfDayType | Enum: .morning, .afternoon, .evening, .night         |
| formatted | String             | Human-readable string, capitalized (e.g., "Morning") |
#### example 
```swift
if SMCtxTimeOfDay.current == .evening {
    enableChillMode()
}

Text("Good \(SMCtxTimeOfDay.formatted)!")
```
#
### Weekday / Weekend (`SMCtxWeekdayWeekend`)
**import**
```swift
import SMCtxWeekdayWeekend
```
| Property  | Type          | Description                                   |
| --------- | ------------- | --------------------------------------------- |
| current   | SMCtxWeekType | Enum: .weekday, .weekend                      |
| isWeekend | Bool          | True if today is Saturday or Sunday           |
| isWeekday | Bool          | True if today is Monday–Friday                |
| formatted | String        | Human-readable string: "Weekday" or "Weekend" |
#### example
```swift
if SMCtxWeekdayWeekend.isWeekend {
    showRelaxedUI()
}

Text("Today is a \(SMCtxWeekdayWeekend.formatted)")
```
#
###  Holidays (`SMCtxHolidays`)
| Property  | Type             | Description                                                                                     |
| --------- | ---------------- | ----------------------------------------------------------------------------------------------- |
| current   | SMCtxHolidayType | Enum: .none, .newYearsDay, .valentinesDay, .fourthOfJuly, .halloween, .thanksgiving, .christmas |
| isHoliday | Bool             | True if today is one of the supported holidays                                                  |
| formatted | String           | Human-readable name of holiday, or "None"                                                       |

**import**
```swift
import SMCtxHolidays
```
#### example
```swift
if SMCtxHolidays.current == .halloween {
    enableSpookyTheme()
}

Text("Holiday: \(SMCtxHolidays.formatted)")
```
### Holiday “Week Of” Support (Optional)
in this i use 7 days you can use whatever amount of days by changing the number after "="
By default, a holiday is only active on its exact day.

If you want holidays to stay active for multiple days (for example, a full holiday week),
you can set a global day range like this:
```swift
SMCtxHolidays.holidayRadiusDays = 7
```
**Where to put this**

Put this once when your app starts, usually inside your @main App file (ussally named your app name followed by app) : 
```swift
  @main
struct MyApp: App {
    init() {
        SMCtxHolidays.holidayRadiusDays = 7 // put here 
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

```
###What this does (in simple terms)

* 7 means the holiday is active 7 days before and 7 days after the actual date

* The holiday is still active on the exact day itself

* This setting applies everywhere in your app

###Important to know

* This setting is global

* Every time you use SMCtxHolidays, it uses this value

* You cannot currently set different ranges for different holidays

* If you don’t set this, holidays only activate on the exact day
#
### Battery (`SMCtxBattery`)
**import**
```swift
import SMCtxBattery
```
| Property       | Type  | Description                                  |
| -------------- | ----- | -------------------------------------------- |
| level          | Float | Battery level 0.0 → 1.0, -1.0 if unavailable |
| percentage     | Int   | Battery percentage 0 → 100                   |
| isLow          | Bool  | True if battery ≤ 20%                        |
| isCharging     | Bool  | True if device is charging or full           |
| isLowPowerMode | Bool  | True if Low Power Mode is enabled            |
#### example
```swift
if SMCtxBattery.isLow {
    enableMinimalUI()
}

Text("Battery: \(SMCtxBattery.percentage)%")

if SMCtxBattery.isLowPowerMode {
    reduceAnimations()
}
```
#
## notes
* iOS 13+ only
* no mac only iphone/ipad
* `SMCtxBattery`  depends UIKit so thats why iphone and ipad only 
* All modules are **standalone**, no dependencies between modules
* Import **only the modules you need** to keep builds small
* No setup required — everything is **ready to use**

---

#
## Summary
SkysMindCtx provides a **plug-and-play, modular, context-aware SDK** for iOS apps.

* Choose only the modules you need
* Get **time, day, holiday, and battery context** in one place
* Simple enums, convenience flags, and human-readable strings
* Designed for **clean logic** and **UI integration**
 ---
 #
