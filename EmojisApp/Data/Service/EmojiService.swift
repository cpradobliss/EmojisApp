import Foundation

class EmojiService {

    private var networkManager: NetworkManager = .init()
    
    func fetchEmojis() {
        networkManager.executeNetworkCall(EmojiAPI.getEmojis) { (result: Result<EmojiResponse, Error>) in
            switch result {
            case .success(let success):
                print("Success: \(success)")
            case .failure(let failure):
                print("Error: \(failure)")
            }
        }
    }
    
    func getRandomEmojiUrl() {
        // fetch emojis and return a random emoji
    }
}
