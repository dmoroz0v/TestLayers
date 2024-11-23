import Foundation
import NotesCore
import NoteEditApplication
import NoteEditUI

public class NoteEditSceneAssembly {

    private let diComponentProvider: () -> (NoteEditDIComponent)

    public init(diComponentProvider: @escaping @autoclosure () -> (NoteEditDIComponent)) {
        self.diComponentProvider = diComponentProvider
    }

    public func assemble(
        note: Note,
        delegate: NoteEditViewModelDelegate
    ) -> NoteEditView {
        let diComponent = diComponentProvider()
        let viewModel = NoteEditViewModel(note: note, notesProvider: diComponent.notesProvider)
        viewModel.delegate = delegate
        return NoteEditView(viewModel: viewModel)
    }
}
