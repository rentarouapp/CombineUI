//
//  APIClient.swift
//  CombineUI
//
//  Created by 上條蓮太朗 on 2023/09/03.
//

import Foundation
import Combine

protocol GithubAPIClientProtocl: AnyObject {
    func searchRepositories(searchWord: String) -> AnyPublisher<GithubRepositoryModel, Error>
}

final class GithubAPIClient: GithubAPIClientProtocl {
    static let shared = GithubAPIClient()
    private init() {}

    func searchRepositories(searchWord: String) -> AnyPublisher<GithubRepositoryModel, Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)&per_page=20")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: GithubRepositoryModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
