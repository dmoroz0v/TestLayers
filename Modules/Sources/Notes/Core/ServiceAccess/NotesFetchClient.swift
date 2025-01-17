import Foundation
import NotesModel
import NotesCoreDTO

public class NotesFetchClient {
    public init() {}
    public func fetch(completion: @escaping ([Note]) -> Void) {
        // условно ходим в ручку GET https://example.com/notes
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let s = UserDefaults.standard.string(forKey: "notes") ?? "[]"
            let dto = (try? JSONDecoder().decode([NoteDTO].self, from: s.data(using: .utf8)!)) ?? []
            completion(NoteDTOToDomainConverter().notes(from: dto))
        }
    }
}
