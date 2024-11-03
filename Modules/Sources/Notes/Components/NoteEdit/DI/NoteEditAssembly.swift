import Foundation
import NotesDomainModel
import NoteEditUI
import NoteEditApplication

public class NoteEditAssembly {

    private let componentProvider: () -> (NoteEditComponent)

    public init(componentProvider: @escaping @autoclosure () -> (NoteEditComponent)) {
        self.componentProvider = componentProvider
    }

    public func assemble(note: Note) -> NoteEditView {
        let component = componentProvider()
        let viewModel = NoteEditViewModel(note: note, notesProvider: component.notesProvider)
        let view = NoteEditView(viewModel: viewModel)
        return view
    }
}
