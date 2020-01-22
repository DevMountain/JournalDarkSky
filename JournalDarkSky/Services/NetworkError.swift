//
//  NetworkError.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/20/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noDataFound
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Could not contact the server."
        case .thrownError(let error):
            return error.localizedDescription
        case .noDataFound:
            return "The server responded with no data."
        }
    }
}
