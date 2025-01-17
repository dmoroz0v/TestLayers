import Foundation

public struct Note {

    public var id: UUID
    public var title: String
    public var text: String

    public init(id: UUID, title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }

}
