//
//  JSONRepository.swift
//  JournalDarkSky
//
//  Created by Jared Warren on 1/22/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class JSONRepository {
    
    private static func fileURL(name: String) -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "\(name).json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    static func saveData(data: Data, name: String) {
        do {
           try data.write(to: fileURL(name: name))
        } catch {
            print(error, error.localizedDescription)
        }
    }
    
    static func loadData(name: String) -> Data? {
        do {
            let data = try Data(contentsOf: fileURL(name: name))
            return data
        } catch {
            print(error, error.localizedDescription)
            return nil
        }
    }
}
