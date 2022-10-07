import Foundation

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
