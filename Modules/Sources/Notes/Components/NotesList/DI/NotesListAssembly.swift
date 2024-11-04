import Foundation
import NotesCore
import NotesListApplication

public class NotesListAssembly {

    private let componentProvider: () -> (NotesListComponent)

    public init(componentProvider: @escaping @autoclosure () -> (NotesListComponent)) {
        self.componentProvider = componentProvider
    }

    public func assemble() -> NotesListViewModel {
        let component = componentProvider()
        return NotesListViewModel(notesProvider: component.notesProvider)
    }
}
