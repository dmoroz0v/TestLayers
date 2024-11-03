import Foundation
import NotesDomainModel

struct NoteDTO: Codable {
    var id: String
    var title: String
    var text: String
}
