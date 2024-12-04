//
//  FileManager.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import Foundation

final class FileManager {
    static let shared = FileManager()
    private init() {}
    
    
    func loadSessions(filename fileName: String) -> [Session]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("sessions.json didn't find")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let sessions = try decoder.decode(Sessions.self, from: data)
            return sessions.array
        } catch {
            print("Downloading sessions failed: \(error)")
            return nil
        }
    }
}
