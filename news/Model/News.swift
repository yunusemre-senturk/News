//
//  News.swift
//  news
//
//  Created by Yunus Emre Şentürk on 1.03.2024.
//

import Foundation

// MARK: - News
struct News: Codable {
    let success: Bool?
    let result: [NewsDetail]?
}

// MARK: - Result
struct NewsDetail: Codable {
    let key: String?
    let url: String?
    let description: String?
    let image: String?
    let name, source: String?
}
