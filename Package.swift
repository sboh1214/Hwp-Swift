// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Hwp-Swift",
    products: [
        .library(name: "Core Hwp", targets: ["CoreHwp"])
    ],
    dependencies: [
        .package(url: "https://github.com/CoreOffice/OLEKit.git", .exact("0.2.0")),
        .package(url: "https://github.com/tsolomko/SWCompression.git", .exact("4.5.7"))
    ],
    targets: [
        .target(
            name: "CoreHwp",
            dependencies: [
                "OLEKit",
                "SWCompression"
            ]
        ),
        .testTarget(
            name: "CoreHwpTests",
            dependencies: ["CoreHwp"],
            resources: [
                .copy("Blank/blank-mac2014vp.hwp"),
                .copy("Blank/blank-win2018.hwp"),
                .copy("Blank/blank-win2020.hwp"),
                .copy("Noori/noori.hwp"),
                .copy("Versions/2007.hwp"),
                .copy("Versions/2014VP.hwp")
            ]
        )
    ]
)
