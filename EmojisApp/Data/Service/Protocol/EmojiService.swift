import Foundation

protocol EmojiService {
    func getEmojis(completion: @escaping (Result<[Emoji], Error>) -> Void)
}
