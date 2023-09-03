//
//  ContentView.swift
//  CombineUI
//
//  Created by 上條蓮太朗 on 2023/09/03.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel: SearchGithubRepositoriesViewModel = SearchGithubRepositoriesViewModel()
    @State private var searchText: String = "SwiftUI"
    
    var body: some View {
        VStack {
            TextField("検索したい言葉", text: self.$searchText)
            Button("更新", action: {
                self.viewModel.searchButtonTapped(searchWord: self.searchText)
            })
            Text(self.viewModel.repositories.first?.fullName ?? "Hello, world!")
        }
        .padding()
    }
}
