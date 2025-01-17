import Foundation
import SwiftUI
import NotesListApplication
import NotesModel

public struct NotesListView: View {

    @ObservedObject var viewModel: NotesListViewModel

    public var body: some View {
        switch viewModel.viewState.result {
        case .processing:
            ProgressView()
        case .value(let notes):
            VStack {
                ForEach(notes, id: \.id) { note in
                    VStack {
                        Text(note.title)
                        Text(note.text)
                    }
                    .onTapGesture {
                        viewModel.onTapNode(id: note.id)
                    }
                }
            }
        }
    }

    public init(viewModel: NotesListViewModel) {
        self.viewModel = viewModel
    }
}
