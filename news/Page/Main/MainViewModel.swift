//
//  MainViewModel.swift
//  news
//
//  Created by Yunus Emre Şentürk on 1.03.2024.
//

import Foundation
class MainViewModel: ObservableObject {
    @Published var news: News?
    private let apiService = ApiService()
    
    func fetchNews() {
        do{
            let file = Bundle.main.url(forResource: "News", withExtension: "json")!
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            self.news = try decoder.decode(News.self, from: data)
        }
        catch{
            print("Error: \(error)")
        }
    }
    
}
