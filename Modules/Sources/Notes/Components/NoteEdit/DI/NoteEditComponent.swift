import NeedleFoundation
import NotesCore

public protocol NoteEditDependency: Dependency {
    var notesProvider: NotesProvider { get }
}

public class NoteEditComponent: Component<NoteEditDependency> {
}
