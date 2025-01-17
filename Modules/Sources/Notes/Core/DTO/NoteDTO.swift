import Foundation

public struct NoteDTO: Codable {
    public var id: String
    public var title: String
    public var text: String

    public init(id: String, title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }
}
