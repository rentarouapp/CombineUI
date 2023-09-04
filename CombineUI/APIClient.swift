//
//  APIClient.swift
//  CombineUI
//
//  Created by 上條蓮太朗 on 2023/09/03.
//

import Foundation
import Combine

protocol GithubAPIClientProtocol: AnyObject {
    func searchRepositories(searchWord: String) -> AnyPublisher<GithubRepositoryModel, Error>
}

final class GithubAPIClient: GithubAPIClientProtocol {
    static let shared = GithubAPIClient()
    private init() {}

    func searchRepositories(searchWord: String) -> AnyPublisher<GithubRepositoryModel, Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(searchWord)&per_page=20")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .map {
                print("uejo_data: \($0.data)")
                print("uejo_response: \($0.response)")
                return $0.data
            }
            .decode(type: GithubRepositoryModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
