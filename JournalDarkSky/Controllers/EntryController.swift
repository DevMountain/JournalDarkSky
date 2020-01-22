//
//  EntryController.swift
//  JournalDarkSky
//
//  Created by Jared Warren on 1/21/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class EntryController {
    
    static let shared = EntryController()
    var entries = [Entry]()
    private init() {
        // load entries
    }
    
    func createEntry(title: String, quote: String, weatherSummary: String, temperature: String) {
        let entry = Entry(title: title, quote: quote, weatherSummary: weatherSummary, temperature: temperature)
        entries.append(entry)
        
    }
    
    func update(entry: Entry, title: String) {
        entry.text = title
        
    }
    
    func delete(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        
    }
}
