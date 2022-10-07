import Foundation

class FakeEmojiService: EmojiService {
    func getEmojis(completion: @escaping (Result<[Emoji], Error>) -> Void) {
        let emojis: [Emoji] = [
            .init(name: "test", imageUrl: URL(string: "https://github.githubassets.com/images/icons/emoji/unicode/2600.png?v8")!),
        ]
        completion(.success(emojis))
    }
}
