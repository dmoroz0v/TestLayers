import Foundation
import NeedleFoundation
import NotesCore
import NotesListApplication
import NotesListScene
import NoteEditApplication
import NoteEditScene

public protocol NotesDependencies {
}

public class NotesComponent: BootstrapComponent {

    private let dependencies: NotesDependencies

    public init(dependencies: NotesDependencies) {
        self.dependencies = dependencies
    }

    public var notesListSceneAssembly: NotesListSceneAssembly {
        NotesListSceneAssembly(diComponentProvider: NotesListDIComponent(parent: self))
    }

    public var noteEditSceneAssembly: NoteEditSceneAssembly {
        NoteEditSceneAssembly(diComponentProvider: NoteEditDIComponent(parent: self))
    }

    public var notesProvider: NotesProvider { shared { NotesProvider() } }
}
