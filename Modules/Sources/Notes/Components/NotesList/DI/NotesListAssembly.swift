import Foundation
import NotesDomainModel
import NotesListUI
import NotesListApplication

public class NotesListAssembly {

    private let componentProvider: () -> (NotesListComponent)

    public init(componentProvider: @escaping @autoclosure () -> (NotesListComponent)) {
        self.componentProvider = componentProvider
    }

    public func assemble(
        delegate: NotesListViewModelDelegate
    ) -> NotesListView {
        let component = componentProvider()
        let viewModel = NotesListViewModel(notesProvider: component.notesProvider)
        viewModel.delegate = delegate
        let view = NotesListView(viewModel: viewModel)
        return view
    }
}
