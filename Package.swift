// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HwpKit",
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
            .revision("14c4e245519cfd9b822f7e365734b6e08e092503")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HwpKit",
            dependencies: ["OLEKit"]
        ),
        .testTarget(
            name: "HwpKitTests",
            dependencies: ["HwpKit"],
            resources: [
                .copy("Basic/blank.hwp"),
                .copy("Basic/content.hwp")
            ]
        )
    ]
)
