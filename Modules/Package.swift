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

        // Notes Domain
        .target(
            name: "NotesDomainModel",
            dependencies: [
            ],
            path: "Sources/Notes/Domain/Model"
        ),
        .target(
            name: "NotesDomainData",
            dependencies: [
                "NotesDomainModel",
            ],
            path: "Sources/Notes/Domain/Data"
        ),
        .target(
            name: "NotesDomainCore",
            dependencies: [
                "NotesDomainData",
                "NotesDomainModel",
            ],
            path: "Sources/Notes/Domain/Core"
        ),

        // NotesList Component
        .target(
            name: "NotesListApplication",
            dependencies: [
                "NotesDomainModel",
                "NotesDomainCore",
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
            name: "NotesListDI",
            dependencies: [
                "NotesListApplication",
                "NotesListUI",
                "NotesDomainModel",
                "NotesDomainCore",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Components/NotesList/DI"
        ),

        // NoteEdit Component
        .target(
            name: "NoteEditApplication",
            dependencies: [
                "NotesDomainModel",
                "NotesDomainCore",
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
            name: "NoteEditDI",
            dependencies: [
                "NoteEditApplication",
                "NoteEditUI",
                "NotesDomainModel",
                "NotesDomainCore",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Components/NoteEdit/DI"
        ),

        // Notes Product
        .target(
            name: "NotesProduct",
            dependencies: [
                "NotesDomainModel",
                "NotesDomainCore",
                "NotesListDI",
                "NoteEditDI",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Products/Notes"
        ),
    ]
)
