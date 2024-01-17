//
//  NetworkManager.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 14/01/24.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Request Methods
    
    func post<T: Codable>(url: String, parameters: Parameters?, completion: @escaping (Result<T, Error>) -> Void) {
        // decoder
        let customDecoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        // request
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self, decoder: customDecoder) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

