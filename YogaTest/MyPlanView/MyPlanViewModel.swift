//
//  MyPlanViewModel.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import Foundation

final class MyPlanViewModel: ObservableObject {
    
    let fileManager = FileManager.shared
    @Published var sessions: [Session] = []
    @Published var selectedSession = 0
    @Published var isShowingAlert = false
    
    func fetchSessions() {
        guard let sessionsData = fileManager.loadSessions(filename: "sessions") else {
            print("Fetch error")
            return
        }
        sessions = sessionsData
        print("Fetch success")
    }
}
