import Foundation
import NeedleFoundation
import NotesDomainCore
import NotesListDI
import NoteEditDI

public protocol NotesDependencies {
}

public class NotesComponent: BootstrapComponent {

    private let dependencies: NotesDependencies

    public init(dependencies: NotesDependencies) {
        self.dependencies = dependencies
    }

    public var notesListAssembly: NotesListAssembly {
        NotesListAssembly(componentProvider: NotesListComponent(parent: self))
    }

    public var noteEditAssembly: NoteEditAssembly {
        NoteEditAssembly(componentProvider: NoteEditComponent(parent: self))
    }

    public var notesProvider: NotesProvider { shared { NotesProvider() } }
}
