import Foundation
import NotesDomainModel
import NotesDomainCore

public protocol NotesListViewModelDelegate: AnyObject {
    func notesListViewModel(_: NotesListViewModel, didSelectNote: Note)
}

public class NotesListViewModel: ObservableObject {

    public struct ViewState {
        public struct Note: Identifiable {
            public var id: UUID
            public var title: String
            public var text: String
        }
        public enum Result {
            case processing
            case value([Note])
        }
        public var result: Result
    }

    public weak var delegate: NotesListViewModelDelegate?
    @Published public private(set) var viewState: ViewState!
    private let notesProvider: NotesProvider

    public init(notesProvider: NotesProvider) {
        self.notesProvider = notesProvider

        updateState()

        notesProvider.addObserver(self)
        notesProvider.fetch()
    }

    public func onTapNode(id: UUID) {
        guard case .value(let notes) = notesProvider.data, let note = notes.first(where: { $0.id == id }) else {
            return
        }
        delegate?.notesListViewModel(self, didSelectNote: note)
    }

    private func updateState() {
        switch notesProvider.data {
        case .processing:
            viewState = .init(result: .processing)
        case .value(let notes):
            viewState = .init(result: .value(
                notes.map({ .init(id: $0.id, title: $0.title, text: $0.text) })
            ))
        }
    }
}

extension NotesListViewModel: NotesProviderObserver {

    public func providerDidUpdate(_: NotesProvider) {
        updateState()
    }

}
