//
//  URLSessionManager.swift
//  JournalDarkSky
//
//  Created by Jared Warren on 1/20/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class URLSessionManager {
    
    static func fetchData(for url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {
                completion(.failure(.noDataFound))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
