import Foundation
import NotesCoreDomain
import NotesListApplication
import NotesListUI

public class NotesListAssembly {

    private let сomponentProvider: () -> (NotesListComponent)

    public init(сomponentProvider: @escaping @autoclosure () -> (NotesListComponent)) {
        self.сomponentProvider = сomponentProvider
    }

    public func assemble(
        delegate: NotesListViewModelDelegate
    ) -> NotesListView {
        let сomponent = сomponentProvider()
        let viewModel = NotesListViewModel(notesProvider: сomponent.notesProvider)
        viewModel.delegate = delegate
        return NotesListView(viewModel: viewModel)
    }
}
