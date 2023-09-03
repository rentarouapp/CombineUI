//
//  GithubRepositoryModel.swift
//  CombineUI
//
//  Created by 上條蓮太朗 on 2023/09/03.
//

import Foundation

struct GithubRepositoryModel: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [GHItem]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct GHItem: Codable, Equatable, Identifiable {
    let id: Int
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
    }
}
