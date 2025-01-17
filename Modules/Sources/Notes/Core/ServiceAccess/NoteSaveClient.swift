import Foundation
import NotesModel
import NotesCoreDTO

public class NoteSaveClient {

    private enum Constants {
        static let notesKey = "notes"
    }

    public init() {
        if UserDefaults.standard.string(forKey: Constants.notesKey) == nil {
            let dto: [NoteDTO] = [
                .init(id: UUID().uuidString, title: "Купить продукты", text: "1. молоко\n2. селедка"),
                .init(id: UUID().uuidString, title: "Домашние дела", text: "1. выкинутть мусор\n2. помыть пол"),
            ]
            if let data = try? JSONEncoder().encode(dto), let s = String(data: data, encoding: .utf8) {
                UserDefaults.standard.setValue(s, forKey: Constants.notesKey)
                UserDefaults.standard.synchronize()
            }
        }
    }

    public func save(note: Note, completion: @escaping () -> Void) {
        // условно ходим в ручку POST https://example.com/note
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {

            let s = UserDefaults.standard.string(forKey: Constants.notesKey) ?? "[]"
            var dto = (try? JSONDecoder().decode([NoteDTO].self, from: s.data(using: .utf8)!)) ?? []

            let index = dto.firstIndex { $0.id == note.id.uuidString }
            if let index {
                dto[index] = .init(id: note.id.uuidString, title: note.title, text: note.text)
            } else {
                dto.append(.init(id: note.id.uuidString, title: note.title, text: note.text))
            }

            if let data = try? JSONEncoder().encode(dto), let s = String(data: data, encoding: .utf8) {
                UserDefaults.standard.setValue(s, forKey: Constants.notesKey)
                UserDefaults.standard.synchronize()
            } else {
                UserDefaults.standard.setValue("[]", forKey: Constants.notesKey)
                UserDefaults.standard.synchronize()
            }

            completion()
        }
    }
}
