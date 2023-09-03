//
//  GithubRepositoryViewModel.swift
//  CombineUI
//
//  Created by 上條蓮太朗 on 2023/09/03.
//

import Foundation
import Combine

class SearchGithubRepositoriesViewModel: ObservableObject {
    private let githubApiClient: GithubAPIClientProtocl
    private var cancellables = Set<AnyCancellable>()

    @Published var repositories = [GHItem]()

    init(githubApiClient: GithubAPIClientProtocl = GithubAPIClient.shared) {
        self.githubApiClient = githubApiClient
    }

    func searchButtonTapped(searchWord: String) {
        githubApiClient
            .searchRepositories(searchWord: searchWord)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    break
                }
            } receiveValue: { model in
                self.repositories = model.items
            }
            .store(in: &cancellables)
    }
    
}
