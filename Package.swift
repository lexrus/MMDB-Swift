// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MMDB",
    products: [
        .library(
            name: "MMDB",
            targets: ["MMDB"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MMDB",
            dependencies: [
                "libmaxminddb"
            ],
            path: "Sources/Swift"
        ),
        .target(
            name: "libmaxminddb",
            path: "Sources/libmaxminddb",
            exclude: ["LICENSE"],
            cSettings: [
                .headerSearchPath("libmaxminddb/Internal")
            ]
        )
    ]
)
