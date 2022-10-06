import Foundation

protocol EmojiService {
    func getEmojis(completion: @escaping (Result<[Emoji], Error>) -> Void)
}

class FakeEmojiService: EmojiService {
    func getEmojis(completion: @escaping (Result<[Emoji], Error>) -> Void) {
        let emojis: [Emoji] = [
            .init(name: "test", imageUrl: URL(string: "https://github.githubassets.com/images/icons/emoji/unicode/2600.png?v8")!),
        ]
        completion(.success(emojis))
    }
}

class APIEmojiService: EmojiService {

    private var networkManager: NetworkManager = .init()
    
    func getEmojis(completion: @escaping (Result<[Emoji], Error>) -> Void) {
        networkManager.executeNetworkCall(EmojiAPI.getEmojis) { (result: Result<EmojiResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.emojis))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
