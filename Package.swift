// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HwpKit",
    platforms: [.macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HwpKit",
            targets: ["HwpKit"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/CoreOffice/OLEKit.git",
            .exact("0.2.0")
        ),
        .package(
            url: "https://github.com/mw99/DataCompression.git",
            .exact("3.6.0")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HwpKit",
            dependencies: ["OLEKit", "DataCompression"]
        ),
        .testTarget(
            name: "HwpKitTests",
            dependencies: ["HwpKit"]
        )
    ]
)
