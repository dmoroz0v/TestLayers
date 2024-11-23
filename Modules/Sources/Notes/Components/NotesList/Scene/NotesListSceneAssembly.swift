import Foundation
import NotesCore
import NotesListApplication
import NotesListUI

public class NotesListSceneAssembly {

    private let diComponentProvider: () -> (NotesListDIComponent)

    public init(diComponentProvider: @escaping @autoclosure () -> (NotesListDIComponent)) {
        self.diComponentProvider = diComponentProvider
    }

    public func assemble(
        delegate: NotesListViewModelDelegate
    ) -> NotesListView {
        let diComponent = diComponentProvider()
        let viewModel = NotesListViewModel(notesProvider: diComponent.notesProvider)
        viewModel.delegate = delegate
        return NotesListView(viewModel: viewModel)
    }
}
