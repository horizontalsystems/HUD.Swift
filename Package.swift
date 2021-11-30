// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "HUD",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "HUD",
            targets: ["HUD"]),
    ],
    dependencies: [
        .package(url: "https://github.com/horizontalsystems/UIExtensions.git", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/horizontalsystems/ThemeKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        .target(
            name: "HUD",
            dependencies: ["UIExtensions", "SnapKit", "ThemeKit"]),
    ]
)
