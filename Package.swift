// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Hwp-Swift",
    products: [
        .library(name: "CoreHwp", targets: ["CoreHwp"])
    ],
    dependencies: [
        .package(url: "https://github.com/CoreOffice/OLEKit.git", .exact("0.3.0")),
        .package(url: "https://github.com/tsolomko/SWCompression.git", .exact("4.5.7")),

        .package(url: "https://github.com/Quick/Nimble", .exact("9.0.0"))
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
            dependencies: [
                "CoreHwp",
                "Nimble"
            ],
            resources: [
                .copy("Blank/blank-mac2014vp.hwp"),
                .copy("Blank/blank-win2018.hwp"),
                .copy("Blank/blank-win2020.hwp"),

                .copy("Noori/noori.hwp"),

                .copy("Versions/2007.hwp"),
                .copy("Versions/2014VP.hwp"),

                .copy("FileHeader/변경내용추적.hwp"),
                .copy("FileHeader/문서암호설정-보안수준보통.hwp"),
                .copy("FileHeader/문서암호설정-보안수준높음.hwp"),
                .copy("FileHeader/공공누리.hwp"),
                .copy("FileHeader/문서이력관리.hwp"),
                .copy("FileHeader/배포용문서.hwp"),
                .copy("FileHeader/CCL.hwp")
            ]
        )
    ]
)
