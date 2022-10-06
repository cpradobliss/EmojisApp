import Foundation

struct Emoji: Codable, CustomStringConvertible {
    let name: String
    let imageUrl: URL

    var description: String {
        "\(name): \(imageUrl)"
    }
}
