import NeedleFoundation
import NotesDomainCore

public protocol NotesListDependency: Dependency {
    var notesProvider: NotesProvider { get }
}

public class NotesListComponent: Component<NotesListDependency> {
}
