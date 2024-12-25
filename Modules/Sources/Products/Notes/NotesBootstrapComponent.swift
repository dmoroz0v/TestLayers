import Foundation
import NeedleFoundation
import NotesCore
import NotesListApplication
import NotesListAssembly
import NoteEditApplication
import NoteEditAssembly

public protocol NotesDependencies {
}

public class NotesBootstrapComponent: BootstrapComponent {

    private let dependencies: NotesDependencies

    public init(dependencies: NotesDependencies) {
        self.dependencies = dependencies
    }

    public var notesListAssembly: NotesListAssembly {
        NotesListAssembly(сomponentProvider: NotesListComponent(parent: self))
    }

    public var noteEditAssembly: NoteEditAssembly {
        NoteEditAssembly(сomponentProvider: NoteEditComponent(parent: self))
    }

    public var notesProvider: NotesProvider { shared { NotesProvider() } }
}
