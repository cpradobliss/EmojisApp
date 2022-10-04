import Foundation

class NetworkManager {
    func executeNetworkCall<ResultType: Decodable>(_ call: APIProtocol, _ resultHandler: @escaping (Result<ResultType, Error>) -> Void) {
        let decoder = JSONDecoder()
        var request = URLRequest(url: call.url)
        request.httpMethod = call.method.rawValue
        call.headers.forEach { (key: String, value: String) in
            request.setValue(value, forHTTPHeaderField: key)
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let result = try? decoder.decode(ResultType.self, from: data) {
                    resultHandler(.success(result))
                } else {
                    resultHandler(.failure(APIError.unknownError))
                }
            } else if let error = error {
                resultHandler(.failure(error))
            }
        }

        task.resume()
    }
}

enum Method: String {
    case get = "GET"
    case post = "POST"
}

protocol APIProtocol {
    var url: URL { get }
    var method: Method { get }
    var headers: [String: String] { get }
}

enum APIError: Error {
    case unknownError
}
