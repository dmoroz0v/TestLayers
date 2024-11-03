import Foundation
import NotesDomainModel

class NoteDTOToDomainConverter {
    func notes(from dto: [NoteDTO]) -> [Note] {
        return dto.compactMap { dto in
            guard let id = UUID(uuidString: dto.id) else {
                return nil
            }
            return Note(id: id, title: dto.title, text: dto.text)
        }
    }
}
