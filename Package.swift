// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HwpKit",
    platforms: [.macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .executable(name: "hwpkit", targets: ["hwpkit"]),
        .library(name: "HwpKitFramework", targets: ["HwpKitFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/CoreOffice/OLEKit.git", .exact("0.2.0")),
        .package(url: "https://github.com/mw99/DataCompression.git", .exact("3.6.0")),
        .package(url: "https://github.com/Carthage/Commandant.git", .exact("0.17.0"))
    ],
    targets: [
        .target(
            name: "hwpkit",
            dependencies: ["HwpKitFramework", "Commandant"]
        ),
        .target(
            name: "HwpKitFramework",
            dependencies: ["OLEKit", "DataCompression"]
        ),
        .testTarget(
            name: "HwpKitFrameworkTests",
            dependencies: ["HwpKitFramework"]
        )
    ]
)
