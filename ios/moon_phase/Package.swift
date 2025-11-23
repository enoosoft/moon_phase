// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "moon_phase",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "moon-phase", targets: ["moon_phase"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "moon_phase",
            dependencies: [],
            path: "Sources/moon_phase"
        )
    ]
)
