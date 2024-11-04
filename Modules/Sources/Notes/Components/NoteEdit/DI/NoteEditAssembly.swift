import Foundation
import NotesCore
import NoteEditApplication

public class NoteEditAssembly {

    private let componentProvider: () -> (NoteEditComponent)

    public init(componentProvider: @escaping @autoclosure () -> (NoteEditComponent)) {
        self.componentProvider = componentProvider
    }

    public func assemble(note: Note) -> NoteEditViewModel {
        let component = componentProvider()
        return NoteEditViewModel(note: note, notesProvider: component.notesProvider)
    }
}
