// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestLayers",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15),
    ],
    products: [
        .library(name: "Notes", targets: [
            "NotesProduct"
        ])
    ],
    dependencies: [
        .package(url: "https://github.com/uber/needle", exact: "0.24.0"),
    ],
    targets: [

        // Notes Core
        .target(
            name: "NotesCore",
            dependencies: [
            ],
            path: "Sources/Notes/Core"
        ),

        // NotesList Scene
        .target(
            name: "NotesListApplication",
            dependencies: [
                "NotesCore",
            ],
            path: "Sources/Notes/Scenes/NotesList/Application"
        ),
        .target(
            name: "NotesListUI",
            dependencies: [
                "NotesListApplication",
            ],
            path: "Sources/Notes/Scenes/NotesList/UI"
        ),
        .target(
            name: "NotesListAssembly",
            dependencies: [
                "NotesListApplication",
                "NotesListUI",
                "NotesCore",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Scenes/NotesList/Assembly"
        ),

        // NoteEdit Scene
        .target(
            name: "NoteEditApplication",
            dependencies: [
                "NotesCore",
            ],
            path: "Sources/Notes/Scenes/NoteEdit/Application"
        ),
        .target(
            name: "NoteEditUI",
            dependencies: [
                "NoteEditApplication",
            ],
            path: "Sources/Notes/Scenes/NoteEdit/UI"
        ),
        .target(
            name: "NoteEditAssembly",
            dependencies: [
                "NoteEditApplication",
                "NoteEditUI",
                "NotesCore",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Scenes/NoteEdit/Assembly"
        ),

        // Notes Product
        .target(
            name: "NotesProduct",
            dependencies: [
                "NotesCore",
                "NotesListApplication",
                "NotesListUI",
                "NotesListAssembly",
                "NoteEditApplication",
                "NoteEditUI",
                "NoteEditAssembly",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Products/Notes"
        ),
    ]
)
