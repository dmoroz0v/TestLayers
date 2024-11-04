import Foundation

public protocol NotesProviderObserver: AnyObject {
    func providerDidUpdate(_: NotesProvider)
}

public class NotesProvider {

    public enum Data {
        case processing
        case value([Note])
    }

    public private(set) var data: Data = .processing {
        didSet {
            observers.allObjects.compactMap({ $0 as? NotesProviderObserver }).forEach {
                $0.providerDidUpdate(self)
            }
        }
    }

    private let fetchClient = NotesFetchClient()
    private let saveClient = NoteSaveClient()
    private let observers = NSHashTable<AnyObject>.weakObjects()

    public init() {
    }

    public func fetch() {
        data = .processing
        fetchClient.fetch { notes in
            self.data = .value(notes)
        }
    }

    public func save(note: Note) {
        saveClient.save(note: note) {
            self.fetch()
        }
    }

    public func addObserver(_ observer: NotesProviderObserver) {
        observers.add(observer)
    }

}
