import Foundation
import SwiftUI
import NoteEditApplication

public struct NoteEditView: View {

    @ObservedObject var viewModel: NoteEditViewModel

    public var body: some View {
        VStack {
            TextField("Заголовок", text: viewModel.state.title)
            TextField("Текст", text: viewModel.state.text)
        }
    }

    public init(viewModel: NoteEditViewModel) {
        self.viewModel = viewModel
    }

}
