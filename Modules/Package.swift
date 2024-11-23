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

        // NotesList Component
        .target(
            name: "NotesListApplication",
            dependencies: [
                "NotesCore",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Components/NotesList/Application"
        ),
        .target(
            name: "NotesListUI",
            dependencies: [
                "NotesListApplication",
            ],
            path: "Sources/Notes/Components/NotesList/UI"
        ),
        .target(
            name: "NotesListScene",
            dependencies: [
                "NotesListApplication",
                "NotesListUI",
                "NotesCore"
            ],
            path: "Sources/Notes/Components/NotesList/Scene"
        ),

        // NoteEdit Component
        .target(
            name: "NoteEditApplication",
            dependencies: [
                "NotesCore",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Components/NoteEdit/Application"
        ),
        .target(
            name: "NoteEditUI",
            dependencies: [
                "NoteEditApplication",
            ],
            path: "Sources/Notes/Components/NoteEdit/UI"
        ),
        .target(
            name: "NoteEditScene",
            dependencies: [
                "NoteEditApplication",
                "NoteEditUI",
                "NotesCore",
            ],
            path: "Sources/Notes/Components/NoteEdit/Scene"
        ),

        // Notes Product
        .target(
            name: "NotesProduct",
            dependencies: [
                "NotesCore",
                "NotesListUI",
                "NotesListApplication",
                "NotesListScene",
                "NoteEditScene",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Products/Notes"
        ),
    ]
)
