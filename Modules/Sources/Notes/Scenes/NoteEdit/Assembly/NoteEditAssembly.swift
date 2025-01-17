import Foundation
import NotesCoreDomain
import NoteEditApplication
import NoteEditUI
import NotesModel

public class NoteEditAssembly {

    private let сomponentProvider: () -> (NoteEditComponent)

    public init(сomponentProvider: @escaping @autoclosure () -> (NoteEditComponent)) {
        self.сomponentProvider = сomponentProvider
    }

    public func assemble(
        note: Note,
        delegate: NoteEditViewModelDelegate
    ) -> NoteEditView {
        let сomponent = сomponentProvider()
        let viewModel = NoteEditViewModel(note: note, notesProvider: сomponent.notesProvider)
        viewModel.delegate = delegate
        return NoteEditView(viewModel: viewModel)
    }
}
