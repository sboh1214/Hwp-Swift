// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HwpKit",
    products: [
        .executable(name: "hwpkit", targets: ["hwpkit"]),
        .library(name: "HwpKitFramework", targets: ["HwpKitFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/CoreOffice/OLEKit.git", .exact("0.2.0")),
        .package(url: "https://github.com/tsolomko/SWCompression.git", .exact("4.5.7")),
        .package(url: "https://github.com/Carthage/Commandant.git", .exact("0.17.0"))
    ],
    targets: [
        .target(
            name: "hwpkit",
            dependencies: ["HwpKitFramework", "Commandant"]
        ),
        .target(
            name: "HwpKitFramework",
            dependencies: [
                "OLEKit",
                "SWCompression"
            ]
        ),
        .testTarget(
            name: "HwpKitFrameworkTests",
            dependencies: ["HwpKitFramework"],
            resources: [
                .copy("Blank/blank-mac2014vp.hwp"),
                .copy("Blank/blank-win2018.hwp"),
                .copy("Noori/noori.hwp"),
                .copy("Versions/2007.hwp"),
                .copy("Versions/2014VP.hwp")
            ]
        )
    ]
)
