import Foundation
import SwiftUI
import NotesDomainModel
import NotesDomainCore

public class NoteEditViewModel: ObservableObject {

    public struct ViewState {
        public var title: Binding<String>
        public var text: Binding<String>
    }

    private var note: Note {
        didSet {
            notesProvider.save(note: note)
        }
    }

    @Published public private(set) var state: ViewState!

    private let notesProvider: NotesProvider

    public init(note: Note, notesProvider: NotesProvider) {
        self.note = note
        self.notesProvider = notesProvider

        state = .init(
            title: Binding(get: {
                self.note.title
            }, set: { value in
                self.note.title = value
            }),
            text: Binding(get: {
                self.note.text
            }, set: { value in
                self.note.text = value
            })
        )
    }

}
