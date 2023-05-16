//
//  StrongApp.swift
//  Strong
//
//  Created by Bekainar on 13.05.2023.
//

import Foundation

actor NetworkingService {
    
    func fetchObject<T: Decodable>(for url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        
        guard statusCode == 200 else {
            throw Error.request(statusCode ?? 404)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}

extension NetworkingService {
    enum Error: LocalizedError, Equatable {
        case request(Int)
        
        var errorDescription: String? {
            switch self {
            case .request(let code):
                return "Request error with response code: \(code)"
            }
        }
    }
}
