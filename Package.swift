// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ResourcePackExample",
    products: [
        .executable(name: "MyGame", targets: ["MyGame"]),
        .library(name: "MyLibrary", type: .dynamic, targets: ["MyLibrary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", revision: "088b001be4de6aca139d998b5ff617b5d9f789e7"),
        .package(url: "https://github.com/migueldeicaza/SwiftGodotKit", revision: "2384998508016d164d363174d633c663c08bcf74")
    ],
    targets: [
        .executableTarget(
            name: "MyGame",
            dependencies: [
                "SwiftGodotKit",
                "MyLibrary"
            ],
            resources: [
                .copy("Resources/MyGame.pck")
            ]
        ),
        .target(
            name: "MyLibrary",
            dependencies: [
                "SwiftGodot"
            ]
        )
    ]
)
