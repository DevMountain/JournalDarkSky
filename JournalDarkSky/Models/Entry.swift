//
//  Entry.swift
//  JournalDarkSky
//
//  Created by Jared Warren on 1/21/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class Entry: Codable {
    var text: String
    let date: Date = Date()
    let quote: String
    let weatherSummary: String
    let temperature: String
    
    
    init(title: String, quote: String, weatherSummary: String, temperature: String) {
        self.text = title
        self.quote = quote
        self.weatherSummary = weatherSummary
        self.temperature = temperature
    }
}

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry ) -> Bool {
        lhs === rhs
    }
}
