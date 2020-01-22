//
//  QuoteService.swift
//  JournalDarkSky
//
//  Created by Jared Warren on 1/21/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class QuoteService {
    
    static let baseURL = URL(string: "https://quote-garden.herokuapp.com")
    static let quotesComponent = "quotes"
    static let randomComponent = "random"
    
    static func fetchQuote(completion: @escaping (Result<Quote, NetworkError>) -> Void) {
        
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        let quoteURL = baseURL.appendingPathComponent(quotesComponent)
        let randomURL = quoteURL.appendingPathComponent(randomComponent)
        
        URLSessionManager.fetchData(for: randomURL) { (result) in
            switch result {
            case .success(let data):
                do {
                    let quote = try JSONDecoder().decode(Quote.self, from: data)
                    completion(.success(quote))
                } catch {
                    print(error, error.localizedDescription)
                    return completion(.failure(.thrownError(error)))
                }
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
