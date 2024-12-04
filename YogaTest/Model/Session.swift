//
//  Session.swift
//  YogaTest
//
//  Created by Nikita Tsomuk on 04.12.2024.
//

import Foundation

struct Sessions: Decodable {
    let array: [Session]
}

struct Session: Decodable {
    let length: Int
    let quoteAuthor: String
    let quote: String
    let chapterName: String
    let chapter: Int
    let difficulty: Difficulty
    
    var backgroundImageName: String {
        switch chapter {
            case 1:
                return "chapter_1_dark"
            case 2:
                return "chapter_2_dark"
            default:
                return "chapter_3_dark"
        }
    }
}

enum Difficulty: String, Decodable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var imageName: String {
        switch self {
            case .easy:
                return "intensity_1_dark"
            case .medium:
                return "intensity_2_dark"
            case .hard:
                return "intensity_3_dark"
        }
    }
}

extension Session {
    static let mockSession: Session = .init(
        length: 7,
        quoteAuthor: "Lao Tzu",
        quote: "He who lives in harmony with himself, lives in harmony with the universe",
        chapterName: "Neck & Shoulders Awakening",
        chapter: 1,
        difficulty: .hard
    )
}
