// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.8
// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "SkysMindCtx",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SMCtxTimeOfDay",
            targets: ["SMCtxTimeOfDay"]
        ),
        .library(
            name: "SMCtxWeekdayWeekend",
            targets: ["SMCtxWeekdayWeekend"]
        ),
        .library(
            name: "SMCtxHolidays",
            targets: ["SMCtxHolidays"]
        ),
        .library(
            name: "SMCtxBattery",
            targets: ["SMCtxBattery"]
        )
    ],
    targets: [
        .target(
            name: "SMCtxTimeOfDay",
            dependencies: []
        ),
        .target(
            name: "SMCtxWeekdayWeekend",
            dependencies: []
        ),
        .target(
            name: "SMCtxHolidays",
            dependencies: []
        ),
        .target(
            name: "SMCtxBattery",
            dependencies: []
        )
    ],
    swiftLanguageVersions: [.v5]
)
