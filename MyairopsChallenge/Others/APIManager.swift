//
//  APIManager.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import Foundation


enum Error: Swift.Error {
    case connectivity
    case invalidData
    case urlFailed
    
    var localizedDescription: String {
        switch self {
        case .connectivity:
            return "Connectivity Error"
        case .invalidData:
            return "Data is not in correct format"
        case .urlFailed:
            return "URL endpoint is wrong"
        }
    }
}

typealias LocalResult<Decodable> = Result<Decodable, Error>

protocol ApiClient {
    func get<T: Decodable>(url: String, headers: [String : String]) async -> LocalResult<T>
}

class URLSessionAPI: ApiClient {
    
    func get<T: Decodable>(url: String, headers: [String : String]) async -> LocalResult<T> {
        guard let url = URL(string: url) else { return .failure(.urlFailed) }
        do {
            let data: T = try await loadItems(from: url, headers: headers)
            return .success(data)
        } catch {
            return .failure(.invalidData)
        }
    }
    
    
    private func loadItems<T: Decodable>(from url: URL, headers: [String : String]) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
    
}
