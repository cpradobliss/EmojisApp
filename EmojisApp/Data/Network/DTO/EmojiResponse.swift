import Foundation

struct EmojiResponse: Decodable {
    let emojis: [Emoji]

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let emojisAsDictionary = try container.decode([String: String].self)
        emojis = emojisAsDictionary.map { (key: String, value: String) in
            Emoji(name: key, imageUrl: URL(string: value)!)
        }
    }
}
