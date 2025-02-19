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

        // Notes Model
        .target(
            name: "NotesModel",
            dependencies: [
            ],
            path: "Sources/Notes/Model"
        ),

        // Notes Core
        .target(
            name: "NotesCoreDTO",
            dependencies: [
            ],
            path: "Sources/Notes/Core/DTO"
        ),
        .target(
            name: "NotesCoreServiceAccess",
            dependencies: [
                "NotesCoreDTO",
                "NotesModel",
            ],
            path: "Sources/Notes/Core/ServiceAccess"
        ),

        .target(
            name: "NotesCoreDomain",
            dependencies: [
                "NotesCoreServiceAccess",
                "NotesModel",
            ],
            path: "Sources/Notes/Core/Domain"
        ),

        // NotesList Scene
        .target(
            name: "NotesListApplication",
            dependencies: [
                "NotesCoreDomain",
                "NotesModel",
            ],
            path: "Sources/Notes/Scenes/NotesList/Application"
        ),
        .target(
            name: "NotesListUI",
            dependencies: [
                "NotesModel",
                "NotesListApplication",
            ],
            path: "Sources/Notes/Scenes/NotesList/UI"
        ),
        .target(
            name: "NotesListAssembly",
            dependencies: [
                "NotesListApplication",
                "NotesListUI",
                "NotesCoreDomain",
                "NotesModel",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Scenes/NotesList/Assembly"
        ),

        // NoteEdit Scene
        .target(
            name: "NoteEditApplication",
            dependencies: [
                "NotesCoreDomain",
                "NotesModel",
            ],
            path: "Sources/Notes/Scenes/NoteEdit/Application"
        ),
        .target(
            name: "NoteEditUI",
            dependencies: [
                "NotesModel",
                "NoteEditApplication",
            ],
            path: "Sources/Notes/Scenes/NoteEdit/UI"
        ),
        .target(
            name: "NoteEditAssembly",
            dependencies: [
                "NoteEditApplication",
                "NoteEditUI",
                "NotesCoreDomain",
                "NotesModel",
                .product(name: "NeedleFoundation", package: "Needle"),
            ],
            path: "Sources/Notes/Scenes/NoteEdit/Assembly"
        ),

        // Notes Product
        .target(
            name: "NotesProduct",
            dependencies: [
                "NotesModel",
                "NotesCoreDomain",
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
